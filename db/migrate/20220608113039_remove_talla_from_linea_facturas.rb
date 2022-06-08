class RemoveTallaFromLineaFacturas < ActiveRecord::Migration[7.0]
  def change
    remove_column :linea_facturas, :talla, :string
  end
end
