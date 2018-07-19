class User < ActiveRecord::Base
  has_many :offers
  has_many :service_requests

  def completed_service_request_offers
    ServiceTransaction.where(aasm_state: :completed)
      .includes(offer: :service_request)
      .where(offer: {service_requests: {user_id: id}})
      .map(&:offer)
  end

  def service_request_points
    completed_service_request_offers
      .map(&:karma_points)
      .reduce(:+)
  end

  def completed_offers
    offers.where(aasm_state: :completed)
  end

  def offer_points
    completed_offers
      .map(&:karma_points)
      .reduce(:+)
  end

  def karma_points
    offer_points - request_points
  end
end
