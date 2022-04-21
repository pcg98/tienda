Rails.application.routes.draw do
  resources :carritos_productos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :productos
  root "productos#index"
end
