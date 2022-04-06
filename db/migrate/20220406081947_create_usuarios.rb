class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :correo
      t.string :nombre
      t.string :apellidos
      t.string :password
      t.boolean :admin

      t.timestamps
    end
  end
end
