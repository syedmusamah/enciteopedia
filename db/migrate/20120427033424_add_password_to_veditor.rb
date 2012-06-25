class AddPasswordToVeditor < ActiveRecord::Migration
  def change
    add_column :veditors, :password, :string
     add_column :veditors, :reason, :text

  end
end
