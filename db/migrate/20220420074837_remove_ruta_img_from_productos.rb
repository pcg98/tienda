class RemoveRutaImgFromProductos < ActiveRecord::Migration[7.0]
  def change
    remove_column :productos, :ruta_img, :string
  end
end
