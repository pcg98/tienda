class PedidosController < ApplicationController

  def create
    #Creo el pedido del usuario
    @pedido = current_usuario.pedidos.create
    #Asignamos carro
    @pedido.carrito = @current_carrito
    result_stock = @pedido.stock?
    #Si es distinto de true
    if result_stock != true
      flash[:error] = result_stock
      redirect_to carrito_path(@current_carrito)
      return
    end
    if @pedido.save
      flash[:success] = "Exito en el pedido"
      redirect_to pedido_path(@pedido)
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
