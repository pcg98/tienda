class CreateTarjeta < ActiveRecord::Migration[7.0]
  def change
    create_table :tarjeta do |t|
      t.string :iban
      t.integer :cvv
      t.integer :mes_caducidad
      t.integer :year_caducidad
      t.string :titular
      t.belongs_to :usuario, foreign_key: true
      t.timestamps
    end
  end
end
