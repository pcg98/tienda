class RemoveIdRolFromUsuarios < ActiveRecord::Migration[7.0]
  def change
    remove_column :usuarios, :id_rol, :integer
  end
end
