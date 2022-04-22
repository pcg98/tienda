class AddRolToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_reference :usuarios, :rol, null: false, foreign_key: true
  end
end
