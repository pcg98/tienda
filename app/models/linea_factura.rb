class LineaFactura < ApplicationRecord
  belongs_to :carrito
  belongs_to :producto
  belongs_to :size

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
  #Para el stock -> False no hay, true si
  def comprueba_stock
    @size = self.size
    puts @size
    #Vemos si hay stock suficiente...
    if @size.stock < self.unidades
      #Si no tenemos suficiente pongo false
      return false
    else
      return true
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
