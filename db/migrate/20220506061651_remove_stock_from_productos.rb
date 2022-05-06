class RemoveStockFromProductos < ActiveRecord::Migration[7.0]
  def change
    remove_column :productos, :stock, :integer
  end
end
