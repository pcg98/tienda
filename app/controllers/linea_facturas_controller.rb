class LineaFacturasController < ApplicationController
  load_resource class: "Producto"
  load_resource class: "Usuario"
  load_resource class: "Carrito"
  load_resource class: "LineaFactura"
  load_resource class: "Size"

  def create
    #Obtenemos carrito
    @carrito = current_carrito
    #Le ponemos la linea de factura recibida
    @linea_factura = @carrito.linea_facturas.new(linea_factura_params)
    #Lo guardamos
    @carrito.save
    #Guardamos el id del carrito
    session[:carrito_id] = @carrito.id
  end
  def update
    #Obtenemos carrito
    @carrito = current_carrito
    #Obtenemos linea
    @linea_factura = @carrito.linea_facturas.find(params[:id])
    #La actulizamos
    @linea_factura.update(linea_factura_params)
    #Las lineas factura
    @linea_facturas = current_carrito.linea_facturas
  end
  def destroy
    #Obtenemos carro
    @carrito = current_carrito
    #Obt linea
    @linea_factura = @carrito.linea_facturas.find(params[:id])
    #destruyo
    @linea_factura.destroy
    @linea_facturas = current_carrito.linea_facturas
  end

  def linea_factura_params
    params.require(:linea_factura).permit(:unidades,:producto_id,:talla)
  end
end
