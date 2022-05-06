class RemoveProductosIdFromSizes < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :sizes, :productos
    remove_reference :sizes, :productos
  end
end
