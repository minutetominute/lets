class ServiceRequestsController < ApplicationController
  before_action :current_user

  def index
    @service_requests = ServiceRequest.all
  end

  def new
    @service_request = ServiceRequest.new
  end

  def show
    @service_request = ServiceRequest.find(params[:id])
  end

  def create
    @service_request = ServiceRequest.new(service_request_params)

    byebug
    if @service_request.save
      redirect_to @service_request
    else
      render 'new'
    end
  end

  def service_request_params
    params.require(:service_request).permit(:title, :description)
  end
end
