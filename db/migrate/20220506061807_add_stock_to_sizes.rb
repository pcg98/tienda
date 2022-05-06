class AddStockToSizes < ActiveRecord::Migration[7.0]
  def change
    add_column :sizes, :stock, :integer
  end
end
