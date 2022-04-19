class Pedido < ApplicationRecord
  belongs_to :carrito
  belongs_to :usuario
end
