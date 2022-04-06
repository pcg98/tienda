class CreateMarcas < ActiveRecord::Migration[7.0]
  def change
    create_table :marcas do |t|
      t.string :marca

      t.timestamps
    end
  end
end
