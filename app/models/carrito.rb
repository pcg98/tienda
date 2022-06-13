class Carrito < ApplicationRecord
  belongs_to :usuario
  has_many :linea_facturas, dependent: :destroy
  has_many :productos, through: :linea_facturas
  has_many :sizes, through: :linea_facturas
  #Antes de insertarlo, que calcule su precio
  before_save :set_precio_total
  #Tras guardar carrito, quitamos stock
  after_save :resta_stock
  before_create :set_fields

  def precio_total
    #Cojo el array de lineas facturas y lo recorro uno a uno
    linea_facturas.collect{|linea_factura| linea_factura.valid? ? linea_factura.precio_linea : 0}.sum
  end

  #True tenemos, false no
  def comprueba_stock?
    linea_facturas.collect do |linea_factura|
      if !linea_factura.comprueba_stock
        #Si no tiene ya, devolvemos un false
        return "No hay suficiente stock de #{linea_factura.producto.nombre}"
      end
    end
    #Si tiene stock, lo devolvemos como true
    return true
  end


  private

  def resta_stock
    linea_facturas.collect do |linea_factura|
      #Obtenemos size
      @size = linea_factura.size
      #Restamos unidades
      @size.stock -= linea_factura.unidades
      #Guardamos
      @size.save
    end
  end
  def set_fields
    self.fecha_creaccion = Time.now
    self.finalizado = false
  end
  def set_precio_total
    self[:precio_total] = precio_total
  end
  #Para cerrar el carrito
  def cierre
    self.finalizado=true
  end


end
