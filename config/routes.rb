Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "requests#index"

  get "/request/new" => "requests#create"

  get "/offer" => "requests#offer"

  get "/accept" => "requests#accept"

end
