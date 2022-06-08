class AddSizeToLineaFacturas < ActiveRecord::Migration[7.0]
  def change
    add_reference :linea_facturas, :size, null: false, foreign_key: true
  end
end
