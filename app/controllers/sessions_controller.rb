class SessionsController < ApplicationController
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
end
