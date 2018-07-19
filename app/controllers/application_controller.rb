class ApplicationController < ActionController::Base
  before_action :current_user
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : User.first
  end
end
