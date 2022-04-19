class CreateCarritos < ActiveRecord::Migration[7.0]
  def change
    create_table :carritos do |t|
      t.datetime :fecha_creaccion
      t.float :precio_total
      t.boolean :finalizado
      t.belongs_to :usuario, foreign_key: true
      t.timestamps
    end
  end
end
