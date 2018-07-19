class User < ActiveRecord::Base
  has_many :completed_offers, -> {
    joins(:offers).where(
      offers: { aasm_state: :completed }
    )
  }
  
  has_many :offers
  has_many :service_requests
  has_many :offer_transactions, through: :offer
  has_many :request_transactions, through: :transactions

  def request_points
    request_transactions.reduce do |agg, transaction|
      agg += transaction.offer.karma_points
    end
  end

  def offer_points
    offer_transactions.reduce do |agg, transaction|
      agg += transaction.offer.karma_points
    end
  end

  def karma_points
    offer_points - request_points
  end
end
