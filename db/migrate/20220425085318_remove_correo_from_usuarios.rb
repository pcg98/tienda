class RemoveCorreoFromUsuarios < ActiveRecord::Migration[7.0]
  def change
    remove_column :usuarios, :correo, :string
  end
end
