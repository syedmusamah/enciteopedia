class AddSaltToEditors < ActiveRecord::Migration
  def change
    add_column :editors, :salt, :string
  end
end
