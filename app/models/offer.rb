class Offer < ActiveRecord::Base
  include AASM

  belongs_to :service_request
  belongs_to :user
  has_many :service_transactions

  aasm do
    state :pending, :initial => true
    state :completed, :rejected, :cancelled, :accepted

    event :cancel do
      transitions :from => :pending, :to => :cancelled
    end

    event :complete, :after => :complete_service_request! do
      transitions :from => :accepted, :to => :completed
    end

    event :timeout do
      transitions :from => :pending, :to => :rejected
    end

    event :accept, :after => :create_open_service_transaction! do
      transitions :from => :pending, :to => :accepted
    end
  end

  def create_open_service_transaction!
    ServiceTransaction.create!(offer: self)
  end

  def complete_service_request!
    service_request.complete!
  end
end
