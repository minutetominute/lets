class Transaction < ActiveRecord::Base
  include AASM

  belongs_to :offer
  belongs_to :request

  aasm do
    state :open, initial: true
    state :completed

    event :log_transaction do
      transitions :from => :open, :to => :completed
    end

  end
end
