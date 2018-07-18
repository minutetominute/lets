Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "requests#index"
  get "/request/new", to: "requests#create"
  get "/requests/:id", to: "requests#show"

  get "/offer/new", to: "offers#create"

  get "/accept", to: "requests#accept"

  get "/profiles", to: "profiles#profile"

  get "/users/:id" => "users#show"

  resources :sessions
end
