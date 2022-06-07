class Carrito < ApplicationRecord
  belongs_to :usuario
  has_many :linea_facturas, dependent: :destroy
  has_many :productos, through: :linea_facturas
  #Antes de insertarlo, que calcule su precio
  before_save :set_precio_total

  def precio_total
    #Cojo el array de lineas facturas y lo recorro uno a uno
    linea_facturas.collect{|linea_factura| linea_factura.valid? ? linea_factura.precio_linea : 0}.sum
  end

  private


  def set_precio_total
    self[:precio_total] = precio_total
  end
  #Para cerrar el carrito
  def cierre
    self.finalizado=true
  end


end
