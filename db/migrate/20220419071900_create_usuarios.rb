class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :correo
      t.string :telefono
      t.integer :id_rol
      t.string :nombre
      t.belongs_to :rol, index: true, foreign_key: true
      t.string :apellidos

      t.timestamps
    end
  end
end
