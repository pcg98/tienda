class ProductoController < ApplicationController
  # GET /producto
  def index
    @productos = Producto.all

    render json: @productos
  end

  # GET /producto/:id
  def show
    @producto = Producto.find(params[:id])
    render json: @producto
  end

  # POST /producto
  def create
    @producto = Producto.new(producto_params)

    if @producto.save
      render json: @producto, status: :created, location: @producto
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  private
  #Estos son los atributos necesarios para insertar el producto
  def producto_params
    params.require(:producto).permit(:talla,:nombre,:precio,:stock,:categoria,:sexo,:marca,:image)
  end
end
