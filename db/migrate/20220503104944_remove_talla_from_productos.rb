class RemoveTallaFromProductos < ActiveRecord::Migration[7.0]
  def change
    remove_column :productos, :talla, :string
  end
end
