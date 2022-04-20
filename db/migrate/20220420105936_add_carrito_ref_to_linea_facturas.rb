class AddCarritoRefToLineaFacturas < ActiveRecord::Migration[7.0]
  def change
    add_reference :linea_facturas, :carrito, null: false, foreign_key: true
  end
end
