class RemoveAuthorIdFromLineaFacturas < ActiveRecord::Migration[7.0]
  def change
    remove_column :linea_facturas, :author_id, :integer
  end
end
