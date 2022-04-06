Rails.application.routes.draw do
  resources :carrito_productos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :producto
  root "producto#index"
end
