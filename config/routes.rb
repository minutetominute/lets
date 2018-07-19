Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "service_requests#index"

  resources :service_requests
  get "/show/:id", to: "service_requests#show"

  get "/offer/new", to: "offers#create"

  get "/users/:id" => "users#show"

  resources :sessions
end
