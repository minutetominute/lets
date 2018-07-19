class ServiceTransaction < ActiveRecord::Base
  include AASM

  belongs_to :offer
  delegate :service_request, :to => :offer
  has_one :confirmation

  aasm do
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
    confirmation.requester? && confirmation.offerer?
  end

end
