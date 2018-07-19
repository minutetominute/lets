class User < ActiveRecord::Base
  has_many :offers
  has_many :service_requests
  has_many :confirmations

  def completed_service_request_offers
    ServiceTransaction.where(aasm_state: :completed)
      .includes(offer: :service_request)
      .where(offer: {service_requests: {user_id: id}})
      .map(&:offer)
  end

  def service_request_points
    completed_service_request_offers
      .map(&:karma_points)
      .reduce(:+) || 0
  end

  def completed_offers
    offers.where(aasm_state: :completed)
  end

  def offer_points
    completed_offers
      .map(&:karma_points)
      .reduce(:+) || 0
  end

  def karma_points
    offer_points - service_request_points
  end

  def credit_transactions
    credit_transactions = completed_offers
      .map(&:service_transactions)
      .flatten
  end

  def debit_transactions
    debit_transactions = completed_service_request_offers
      .map(&:service_transactions)
      .flatten
  end

  def transaction_history
    credits = credit_transactions.select do |tx|
      tx.completed?
    end
    debits = debit_transactions.select do |tx|
      tx.completed?
    end
    {
      credits: credits,
      debits: debits
    }
  end

  def render_transaction_history
    history = [{request: "abc", member_name:'name', points:5, date:'01/01/2018'}]
  end
end
