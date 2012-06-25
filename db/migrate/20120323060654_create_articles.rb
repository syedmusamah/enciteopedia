class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :aName
      t.string :Category
      t.text :content
      t.integer :hits

      t.timestamps
    end
  end
end
