class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.string :name
      t.string :email
      t.integer :thumbs

      t.timestamps
    end
  end
end
