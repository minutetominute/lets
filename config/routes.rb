Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "service_requests#index"

  resources :service_requests

  get "/offer/new", to: "offers#create"
  put "/offers/:id/cancel", to: "offers#cancel"
  get "/users/:id" => "users#show"
  get "/my_requests" => "users#my_requests"
  get "/my_offers" => "users#my_offers"

  resources :sessions

  delete '/logout',  to: 'sessions#destroy'
end
