class CarritosController < ApplicationController
  load_and_authorize_resource class: "Producto"
  load_resource class: "Usuario"
  load_resource class: "Carrito"
  load_resource class: "LineaFactura"
  def show
    #Mostramos los elementos del carrito
    @linea_facturas = current_carrito.linea_facturas
  end



end
