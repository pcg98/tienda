class CreateLineaFacturas < ActiveRecord::Migration[7.0]
  def change
    create_table :linea_facturas do |t|
      t.string :talla, :limit => 3
      t.float :precio_unitario
      t.integer :unidades
      t.float :precio_linea
      t.belongs_to :author, index: true, foreign_key: true
      t.belongs_to :producto, foreign_key: true
      t.timestamps
    end
  end
end
