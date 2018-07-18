class Transaction < ActiveRecord::Base
  include AASM

  belongs_to :offer
  delegate :request, :to => :offer

  aasm do
    state :open, initial: true
    state :completed, :cancelled

    event :complete do
      transitions :from => :open, :to => :completed
    end

    event :cancel do
      transitions :from => :open, :to => :cancelled
    end

  end
end
