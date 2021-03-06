class ServiceRequestsController < ApplicationController
  before_action :current_user, :current_path

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

    if @service_request.save
      redirect_to @service_request
    else
      render 'new'
    end
  end

  private

  def service_request_params
    params.require(:service_request).permit(:title, :description, :user_id)
  end

end
