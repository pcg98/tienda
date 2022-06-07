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


  #Calculamos el precio linea
  def precio_linea
    result = self.unidades * self.precio_unitario
  end
  #Para el stock
  def comprueba_stock
    #Pillo producto
    producto = Producto.find(self.producto.id)
    @size = producto.sizes.find_by(talla: talla)
    puts @size
    #Vemos si hay stock suficiente...
    if @size.stock < self.unidades
      #Si no tenemos suficiente pongo true
      return true
    else
      #Si no lo resto el stock
      @size.stock -= self.unidades
      #Asigno la talla
      self.talla = @size.talla
      @size.save
      return false
    end
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
