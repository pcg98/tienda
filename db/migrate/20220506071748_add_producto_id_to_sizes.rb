class AddProductoIdToSizes < ActiveRecord::Migration[7.0]
  def change
    add_reference :sizes, :producto, null: false, foreign_key: true
  end
end
