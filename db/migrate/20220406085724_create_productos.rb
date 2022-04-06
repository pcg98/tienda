class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :talla
      t.float :precio
      t.integer :unidades
      t.string :ruta_img
      t.references :id_cat, null: false, foreign_key: true
      t.references :id_marca, null: false, foreign_key: true

      t.timestamps
    end
  end
end
