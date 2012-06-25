class AddPasswordToEditors < ActiveRecord::Migration
  def change
    add_column :editors, :encrypted_password, :string
  end
end
