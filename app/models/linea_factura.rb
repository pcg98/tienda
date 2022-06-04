class LineaFactura < ApplicationRecord
  belongs_to :carrito
  belongs_to :producto

  #Ponemos el precio de la unidad
  before_save :set_precio_unitario
  #Calculamos su precio linea, que es el
  # unitario * unidades
  before_save :set_precio_linea
  #Vemos que el producto tenga stock
  #before_save :comprueba_stock
  #Actualizamos el precio del carrito
  #after_save self:carrito.precio

  def comprueba_stock
    #Si el stock es menor a las unidades...
    if(producto.sizes[:id_size].stock<unidades)
      #Lo ponemos a nil
      self.producto_id=nil
      flash[:error] = "No hay suficiente stock."
      #Recargamos
      redirect_back(fallback_location: root_path)
    end
  end

  def precio_unitario
    #Existe el registro?
    if persisted?
      #Devolvemos el precio que ya tenia
      self[:precio_unitario]
    else
      #Si no... devolvemos el del producto
      producto.precio
    end
  end
  #Calculamos el precio linea
  def precio_linea
    result = unidades*precio_unitario
  end

  private
  #En los getter llamamos a los metodos que se encargan
  # de asignarle su valor
  def set_precio_unitario
    self[:precio_unitario] = precio_unitario
  end
  def set_precio_linea
    self[:precio_linea] = precio_linea
  end

end
