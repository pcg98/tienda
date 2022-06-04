class SizesController < ApplicationController
  def create
    #Pillamos producto
    @producto = Producto.find(params[:producto_id])
    #En ese producto, en las tallas creamos la nueva
    @size = @producto.sizes.create(size_params)
    redirect_to producto_path(@producto)
  end

  def destroy
    #Encontramos producto
    @producto = Producto.find(params[:producto_id])
    #Encontramos talla
    @size = @producto.sizes.find(params[:id])
    #Destruimos
    @size.destroy
    redirect_to producto_path(@producto), status: 303
  end

  def update
    #Obtengo registro talla
    @size = Size.find(params[:id])
    #Actualizamos
    @size.update(size_params)
    redirect_to producto_path(@producto)
  end


  private
  #Que atributos necesitamos de size
  def size_params
    params.require(:size).permit(:stock,:talla)
  end
end
