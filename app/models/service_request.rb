class ServiceRequest < ActiveRecord::Base
  include AASM

  has_many :offers
  belongs_to :user

  aasm do
    state :open, :initial => true
    state :completed

    event :complete do
      transitions :from => :open, :to => :completed
    end
  end

  def pending_offers
    offers.where(aasm_state: :pending)
  end

end
