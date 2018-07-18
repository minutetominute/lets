class Offer
  include AASM

  aasm do
    state :pending, :initial => true
    state :completed, :rejected, :cancelled

    event :remove do
      transitions :from => :pending, :to => :cancelled
    end

    event :log_transaction do
      transitions :from => :pending, :to => :completed
    end

    event :timeout do
      transitions :from => :pending, :to => :rejected
    end
  end

end
