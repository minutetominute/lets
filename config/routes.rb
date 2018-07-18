Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "service_requests#index"

  resources :service_requests
  get "/accept" => "services_request#accept"

  get "/offer/new", to: "offers#create"


  get "/profiles", to: "profiles#profile"

  get "/profiles" => "profiles#profile"

  get "/users/:id" => "users#show"

  resources :sessions
end
