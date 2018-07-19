class OffersController < ApplicationController
  before_action :current_user, :current_path

  def new
    @service_request_id = params[:service_request_id]
    @offer = Offer.new
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to service_request_path(@offer.service_request)
    else
      render 'new'
    end
  end

  def cancel
    Offer.find(params[:offer_id]).cancel!
    redirect_to '/'
  end

  private

  def offer_params
    params.require(:offer).permit(:karma_points, :description, :user_id, :service_request_id)
  end
end
