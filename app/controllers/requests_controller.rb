class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def create
    @request = Request.new
  end

end
