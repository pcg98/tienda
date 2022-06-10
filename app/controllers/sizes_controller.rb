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
    new_stock = params[:stock].to_i
    puts params.as_json, 'Prueba'
    if(new_stock < 0)
      flash[:error] = "No puedes poner stock de menos de 0"
      return
    end
    #Si es para restar...
    if(@size.stock<new_stock)
      #Encuentro todos los carritos sin finalizar
      @carritos = Carrito.where(finalizado: false)
      #Si hay alguno con la talla damos error
      if(@carritos.sizes.include?(@size) )
        flash[:error] = "La talla esta en un carro, intentelo mas tarde"
        redirect_back(fallback_location: root_path)
        return
      end
    end
    #Actualizamos
    if(@size.update(size_params))
    flash[:success] = "Stock cambiado correctamente"
    redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Ha habido algun error"
      redirect_back(fallback_location: root_path)
    end
  end


  private
  #Que atributos necesitamos de size
  def size_params
    params.require(:size).permit(:id,:stock,:talla)
  end
end
