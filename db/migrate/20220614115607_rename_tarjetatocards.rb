class RenameTarjetatocards < ActiveRecord::Migration[7.0]
  def change
    rename_table :tarjeta, :cards
  end
end
