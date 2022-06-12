class Pedido < ApplicationRecord
  belongs_to :carrito
  belongs_to :usuario
  has_many :linea_facturas, through: :carrito
end
