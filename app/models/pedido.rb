class Pedido < ApplicationRecord
  belongs_to :carrito
  belongs_to :usuario
  has_many :linea_facturas, through: :carrito
  before_save :inicio_pedido

  def stock?
    return self.carrito.comprueba_stock?
  end

  private
  def inicio_pedido
    #Cambiamos las cosas del carrito
    self.carrito.finalizado = true
    self.carrito.save
    #Asigno status
    self.status = "Procesando pedido"
  end
end
