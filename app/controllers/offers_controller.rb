class OffersController < ApplicationController
  before_action :current_user
  def create
    @offer = Offer.new
  end

  def cancel
    Offer.find(params[:id]).cancel!
    redirect_to '/'
  end

end
