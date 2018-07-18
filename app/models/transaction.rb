class Transaction < ActiveRecord::Base
  include AASM

  belongs_to :offers
  delegate :request, :to => :offers

  aasm do
    state :open, initial: true
    state :completed, :cancelled

    event :complete, :after => :complete_offer do
      transitions :from => :open, :to => :completed
    end

    event :cancel do
      transitions :from => :open, :to => :cancelled
    end
  end

  def complete_offer
    offer.complete!
  end
end
