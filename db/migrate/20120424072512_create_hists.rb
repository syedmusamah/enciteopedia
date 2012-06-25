class CreateHists < ActiveRecord::Migration
  def change
    create_table :hists do |t|
      t.integer :editor_id, :null => false
      t.integer :article_id, :null => false
      t.string :article_content, :null => false

      t.timestamps
    end
  end
end
