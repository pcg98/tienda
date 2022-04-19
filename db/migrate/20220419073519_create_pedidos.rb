class CreatePedidos < ActiveRecord::Migration[7.0]
  def change
    create_table :pedidos do |t|
      t.datetime :fecha_creaccion
      t.date :fecha_entrega
      t.string :status
      t.belongs_to :carrito, foreign_key: true
      t.belongs_to :usuario, foreign_key: true
      t.timestamps
    end
  end
end
