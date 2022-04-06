class CreateCarritos < ActiveRecord::Migration[7.0]
  def change
    create_table :carritos do |t|
      t.decimal :total
      t.references :id_user, null: false, foreign_key: true
      t.integer :estado
      t.time :fecha_creacion
      t.time :fecha_fin

      t.timestamps
    end
  end
end
