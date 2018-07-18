class Transaction
  include AASM

  aasm do
    state :open, initial: true
    state :completed

    event :log_transaction do
      transitions :from => :open, :to => :completed
    end

  end
end
