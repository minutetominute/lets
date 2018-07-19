class OffersController < ApplicationController
  before_action :current_user
  def create
    @offer = Offer.new
  end

end
