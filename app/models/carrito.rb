class Carrito < ApplicationRecord
  belongs_to :usuario
  has_many :linea_facturas
end
