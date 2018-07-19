Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "service_requests#index"

  #put "/offers/:id/cancel", to: "offers#cancel"
  resources :service_requests do
    resources :offers do
      put 'cancel', to: 'offers#cancel'
    end
  end

  get "/users/:id" => "users#show"
  get "/my_requests" => "users#my_requests"
  get "/my_offers" => "users#my_offers"

  resources :sessions

  delete '/logout',  to: 'sessions#destroy'
end
