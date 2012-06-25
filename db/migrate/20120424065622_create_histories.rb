class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :editor_id, :null => false
      t.integer :article_id, :null => false
      t.string :article_content, :null => false

      t.timestamps
    end
  end
end
