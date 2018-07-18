class RequestsController < ApplicationController
  before_action :current_user

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def create
    @request = Request.new
  end

  def create
    @request = Request.new(params[:request])
  end
end
