class ServiceTransaction < ActiveRecord::Base
  include AASM

  belongs_to :offer
  delegate :service_request, :to => :offer
  has_one :confirmation

  after_create :create_confirmation!

  aasm :whiny_transitions => false do
    state :open, initial: true
    state :completed, :cancelled

    event :complete, :after => :complete_offer! do
      transitions :from => :open, :to => :completed
    end

    event :cancel do
      transitions :from => :open, :to => :cancelled
    end

    event :confirmation_added do
      transitions :from => :open,
        :to => :completed,
        :guard => :parties_agree?
    end
  end

  def complete_offer!
    offer.complete!
  end

  def parties_agree?
    !confirmation.service_requester_id.nil? && !confirmation.offerer_id.nil?
  end

  def create_confirmation!
    Confirmation.create!(service_transaction: self)
  end

end
