class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def create
    @request = Request.new
  end

end
