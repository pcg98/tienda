class LineaFacturasController < ApplicationController

  after_action :set_linea_factura

  def create
    #Obtenemos carrito
    @carrito = @current_carrito
    producto = Producto.find(params['linea_factura']['producto_id'])
    #Obtenemos talla
    size = Size.find(params['linea_factura']['size_id'])
    #Comprobamos si ya esta en el la talla carrito
    if @carrito.sizes.include?(size)
      #Encontramos la linea
      @linea_factura = @carrito.linea_facturas.find_by(size_id: size)
      #Añadimos las necesarias
      @linea_factura.unidades += params['linea_factura']['unidades'].to_i
    else
      #Creamos linea de factura
      @linea_factura = LineaFactura.create
      #Asignamos carro
      @linea_factura.carrito = @carrito
      #Asignamos item
      @linea_factura.producto = producto
      #Talla
      @linea_factura.size = size
      #Precio unitario
      @linea_factura.precio_unitario = producto.precio
      #Cantidad
      @linea_factura.unidades = params['linea_factura']['unidades']
    end
    puts @linea_factura.class,' esta definida'
    #Llamamos al metodo del modelo para comprobar stock
    # Devuelve true si no hay y mostramos mensaje de error
    if @linea_factura.comprueba_stock
      flash[:error] = "No hay suficiente stock"
      redirect_to producto_path(producto)
      return
    end
    #Si tenemos lo guardamos
    @linea_factura.save
    flash[:success] = "Añadido al carrito correctamente"
    #Muestro carrito
    redirect_to producto_path(producto)
  end

  def add_quantity
    #Encontramos la linea
    @linea_factura = @current_carrito.linea_facturas.find(params[:id])
    #Añadimos las necesarias
    @linea_factura.unidades += 1
    #Comprobamos el stock
    if @linea_factura.comprueba_stock
      flash[:error] = "No hay suficiente stock"
      redirect_to carrito_path(@current_carrito)
      return
    end
    #Si tenemos lo guardamos
    @linea_factura.save
    flash[:success] = "Añadido con exito"
    redirect_to carrito_path(@current_carrito)
  end
  def reduce_quantity
    if @linea_factura.unidades > 1
      @linea_factura.unidades -=1
    end
    @linea_factura.save
  end
  def destroy
    #destruyo
    LineaFactura.find(params[:id]).destroy
    redirect_to carrito_path(@current_carrito)
  end

  private

    def set_linea_factura
      #Pillo actual linea
      @linea_factura = LineaFactura.find_by(id: params[:id])
    end

    def linea_factura_params
      params.require(:linea_factura).permit(:unidades,:producto_id,:size_id)
    end
end
