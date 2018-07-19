class Offer < ActiveRecord::Base
  include AASM

  belongs_to :service_request
  belongs_to :user
  has_many :service_transactions

  aasm do
    state :pending, :initial => true
    state :completed, :rejected, :cancelled

    event :cancel do
      transitions :from => :pending, :to => :cancelled
    end

    event :complete do
      transitions :from => :pending, :to => :completed
    end

    event :timeout do
      transitions :from => :pending, :to => :rejected
    end
  end

end
