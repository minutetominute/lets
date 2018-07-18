Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/home" => "requests#index"

  get "/create" => "requests#create"

  get "/offers" => "offers#offers"

  get "/accept" => "requests#accept"

  get "/profiles" => "profiles#profile"

end
