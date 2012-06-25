class AddPToVeditors < ActiveRecord::Migration
  def change
    add_column :veditors, :p, :string
  end
end
