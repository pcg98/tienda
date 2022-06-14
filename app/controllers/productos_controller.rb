class ProductosController < ApplicationController
  #Esto es para que el cancan mire si tenemos los permisos
  load_and_authorize_resource
  layout "productos_layout"
  # GET /productos
  def index
    @productos = Producto.all
  end

  # GET /productos/:id
  def show
    @producto = Producto.find(params[:id])
    @productos = Producto.order(created_at: :desc).limit(3).where.not(id: @producto.id)
    @linea_factura = LineaFactura.new
  end

  def new
    @producto = Producto.new
    #Creamos el hash de tallas para el form
    @producto.sizes.build
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
    redirect_to productos_path, status: :see_other
  end

  private
  #Estos son los atributos necesarios para insertar el productos
  # Hemos metidos los de tallas
  def producto_params
    params.require(:producto).permit(:nombre,:precio,:categoria,:sexo,:marca,:image,
                                     sizes_attributes: [:talla,:stock,:producto_id])
  end
end
