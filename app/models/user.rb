class User < ActiveRecord::Base
  has_many :offers
  has_many :service_requests

  def service_request_points
    service_requests.where()
      .map(:karma_points)
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
