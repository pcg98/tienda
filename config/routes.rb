Rails.application.routes.draw do
  get 'bienvenido/index'
  devise_for :usuarios
  scope '/admin' do
    resources :usuarios
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :productos
  resources :pedidos, only: [:show, :index]
  #root "productos#index"
  resources :productos do
    resources :sizes
  end
  resources :carritos, only: [:show]

  get "/carritos/:carrito_id/pedidos" => "pedidos#create", as: "pedidos_create"

  delete 'carritos/:id' => "carritos#destroy"

  #Que tenga su path tambien
  post "linea_facturas" => "linea_facturas#create"
  get 'linea_facturas/:id/add' => "linea_facturas#add_quantity", as: "linea_factura_add"
  post 'linea_facturas/:id/reduce' => "linea_facturas#reduce_quantity", as: "linea_factura_reduce"
  get 'linea_facturas/:id' => "linea_facturas#show", as: "linea_factura"
  delete 'linea_facturas/:id' => "linea_facturas#destroy"
  root 'bienvenido#index'

  resources :usuarios do
    resources :pedidos, only: [:show, :index]
  end
  get "usuario/nuevo" => "usuarios#new", :as => "registrarse"
end
