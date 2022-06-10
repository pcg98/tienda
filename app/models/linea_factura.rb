class LineaFactura < ApplicationRecord
  belongs_to :carrito
  belongs_to :producto
  belongs_to :size

  #Ponemos el precio de la unidad
  before_save :set_precio_unitario
  #Calculamos su precio linea, que es el
  # unitario * unidades
  before_save :set_precio_linea
  before_destroy :reponer_stock

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
    @size = Size.find(self.size_id)
    puts @size
    #Vemos si hay stock suficiente...
    if @size.stock < self.unidades
      #Si no tenemos suficiente pongo true
      return true
    else
      #Si no lo resto el stock
      @size.stock -= self.unidades
      #Asigno la talla
      self.size = @size
      return false
    end
  end


  private
  #Metodo que sera llamado al borrar
  # una linea de factura para devolver stock
  def reponer_stock
    @size = Size.find(self.size_id)
    puts @size
    #Si no lo resto el stock
    @size.stock += self.unidades
    @size.save
  end
  #En los getter llamamos a los metodos que se encargan
  # de asignarle su valor
  def set_precio_unitario
    self[:precio_unitario] = precio_unitario
  end
  def set_precio_linea
    self[:precio_linea] = precio_linea
  end


end
