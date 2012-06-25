class DropArticleTable < ActiveRecord::Migration
  def up
   drop_table :Articles
  end

  def down
  end
end
