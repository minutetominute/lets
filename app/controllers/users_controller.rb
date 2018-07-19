class UsersController < ApplicationController
  before_action :current_user

  def show
    @user = User.find(params[:id])
  end

  def my_requests
    if current_user
      @service_requests = current_user.service_requests
    end
  end

  def my_offers
    if current_user
      @offers = current_user.offers
    end
  end
end
