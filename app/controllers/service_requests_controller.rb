class ServiceRequestsController < ApplicationController
  before_action :current_user

  def index
    @requests = ServiceRequest.all
  end

  def show
    @request = ServiceRequest.find(params[:id])
  end

  def create
    @request = ServiceRequest.new
  end

  def create
    @request = ServiceRequest.new(params[:request])
  end
end
