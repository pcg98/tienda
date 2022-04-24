Rails.application.routes.draw do
  get 'login', to: 'session#new'
  post 'login', to: 'session#login'
  resources :carritos_productos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :productos
  root "productos#index"

  resources :usuarios
  get "usuario/nuevo" => "usuarios#new", :as => "registrarse"
end
