class Carrito < ApplicationRecord
  belongs_to :usuario
  has_many :linea_facturas, dependent: :destroy
  #Antes de insertarlo, que calcule su precio
  before_save :set_precio_total
  before_create :set_usuario_id

  def precio_total
    #Cojo el array de lineas facturas y lo recorro uno a uno
    linea_facturas.collect{|linea_factura| linea_factura.valid? ? linea_factura.precio_unitario*linea_factura.unidades : 0}.sum
  end

  private

  def set_usuario_id
    self[:usuario_id] = current_usuario.id
  end
  def set_precio_total
    self[:precio_total] = precio_total
  end
  #Para cerrar el carrito
  def cierre
    self.finalizado=true
  end


end
