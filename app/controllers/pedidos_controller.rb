class PedidosController < ApplicationController

  def create
    #Cambiamos las cosas del carrito
    @current_carrito.finalizado = true
    @current_carrito.save
    #Creo el pedido del usuario
    @pedido = current_usuario.pedidos.create
    #Asigno el carro
    @pedido.carrito = @current_carrito
    @pedido.status = "Procesando pedido"
    if @pedido.save
      flash[:success] = "Exito en el pedido"
      redirect_to pedidos_show_path(@pedido)
    else
      flash[:error] = "Error, por favor intentelo mas tarde"
      redirect_to carrito_path(@current_carrito)
    end
  end

  def index
    #Obtenemos los pedidos del usuario
    @pedidos = current_usuario.pedidos
  end
  def show
    @pedido = Pedido.find(params[:id])
  end


  private

    def producto_params
      params.require(:pedido).permit(:nombre,:precio,:categoria,:sexo,:marca,:image,
                                     carrito_attributes: [:talla,:stock,:producto_id])
    end
end
