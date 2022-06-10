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
  #Asi hacemos que se puedan mostrar los carritos
  #resources :carritos, only: [:show]
  get 'carritos/:id' => "carritos#show", as: "carrito"
  delete 'carritos/:id' => "carritos#destroy"

  #Que tenga su path tambien
  post "linea_facturas" => "linea_facturas#create"
  post 'linea_facturas/:id/add' => "linea_facturas#add_quantity", as: "linea_factura_add"
  post 'linea_facturas/:id/reduce' => "linea_facturas#reduce_quantity", as: "linea_factura_reduce"
  get 'linea_facturas/:id' => "linea_facturas#show", as: "linea_factura"
  delete 'linea_facturas/:id' => "linea_facturas#destroy"
  root 'bienvenido#index'

  resources :usuarios
  get "usuario/nuevo" => "usuarios#new", :as => "registrarse"
end
