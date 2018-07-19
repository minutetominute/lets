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

  def confirm_request_service_transaction!(service_transaction_id)
    confirmation = Confirmation.find_by(
      service_transaction_id: service_transaction_id
    )
    confirmation.service_requester_id = id
    confirmation.save!
  end

  def confirm_offer_service_transaction!(service_transaction_id)
    confirmation = Confirmation.find_by(
      service_transaction_id: service_transaction_id
    )
    confirmation.offerer_id = id
    confirmation.save!
  end

  def render_transaction_history
    puts transaction_history[:credits]
    meta1 = (transaction_history[:credits]).map do |trans|
      {request: trans.service_request.title, member_name: trans.offer.service_request.user.name, points: trans.offer.karma_points, date: trans.created_at}
    end

    meta2 = (transaction_history[:debits]).map do |trans|
      {request: trans.service_request.title, member_name: trans.offer.user.name, points: -trans.offer.karma_points, date: trans.created_at}
    end
    (meta1+meta2).sort do |el|
      el[:date]
    end
  end
end
