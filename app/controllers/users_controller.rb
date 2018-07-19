class UsersController < ApplicationController
  before_action :current_user
  def show
    @user = User.find(params[:id])
  end
end
