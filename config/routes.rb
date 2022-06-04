Rails.application.routes.draw do
  get 'bienvenido/index'
  devise_for :usuarios
  scope '/admin' do
    resources :usuarios
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :productos

  #root "productos#index"
  resources :productos do
    resources :sizes
  end
  get 'carritos/show'
  #Asi hacemos que se puedan mostrar los carritos
  resources :carritos, only: [:show]
  #Que tenga su path tambien
  resources :linea_facturas
  root 'bienvenido#index'

  resources :usuarios
  get "usuario/nuevo" => "usuarios#new", :as => "registrarse"
end
