class CreateAeors < ActiveRecord::Migration
  def change
    create_table :aeors do |t|
      t.integer :editor_id, :null => false
      t.integer :article_id, :null => false

      t.timestamps
    end
  end
end
