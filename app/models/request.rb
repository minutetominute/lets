class Request < ActiveRecord::Base
  include AASM

  has_many :offers
  belongs_to :user

  aasm do
    state :open, :initial => true
    state :completed

    event :log_transaction do
      transitions :from => :open, :to => :completed
    end
  end

end
