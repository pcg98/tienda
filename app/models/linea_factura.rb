class LineaFactura < ApplicationRecord
  belongs_to :carrito
  belongs_to :producto
end
