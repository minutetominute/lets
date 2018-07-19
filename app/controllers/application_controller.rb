class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_path
    @current_uri = request.env['PATH_INFO']
  end

  private

  def require_login
    unless current_user
      redirect_to '/sessions/new'
    end
  end
end
