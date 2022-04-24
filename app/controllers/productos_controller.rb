class ProductosController < ApplicationController
  load_and_authorize_resource class: "Producto"
  # GET /productos
  def index
    @productos = Producto.all

  end

  # GET /productos/:id
  def show
    @producto = Producto.find(params[:id])
  end

  def new
    @producto = Producto.new
  end

  # POST /productos
  def create
    @producto = Producto.new(producto_params)

    if @producto.save
      redirect_to @producto
    else
      render :new,status: :unprocessable_entity
    end
  end

  def update
    @producto = Producto.find(params[:id])
    if(@producto.update(producto_params))
      redirect_to @producto
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @producto = Producto.find(params[:id])
  end

  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy

    redirect_to root_path, status: :see_other
  end

  private
  #Estos son los atributos necesarios para insertar el productos
  def producto_params
    params.require(:producto).permit(:talla,:nombre,:precio,:stock,:categoria,:sexo,:marca,:image)
  end
end
