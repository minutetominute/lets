class OffersController < ApplicationController

  def create
    @offer = Offer.new
  end

end
