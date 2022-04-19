class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :talla
      t.string :nombre
      t.float :precio
      t.integer :stock
      t.string :categoria
      t.string :sexo
      t.string :marca
      t.string :ruta_img

      t.timestamps
    end
  end
end
