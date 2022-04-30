class CreateSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :sizes do |t|
      t.string :talla
      t.belongs_to :productos, index: true, foreign_key: true
      t.timestamps
    end
  end
end
