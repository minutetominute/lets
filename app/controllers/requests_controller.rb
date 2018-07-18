class RequestsController < ApplicationController
  def index
    #this will be using the model Request.all for example
    @requests = [
      { name: "Request 1" },
      { name: "Request 2" },
      { name: "Request 3" }
    ]
  end

  def create_request
  end

end
