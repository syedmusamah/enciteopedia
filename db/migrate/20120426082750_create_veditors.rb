class CreateVeditors < ActiveRecord::Migration
  def change
    create_table :veditors do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
