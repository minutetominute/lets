class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.now[:danger] = 'User does not exist'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
