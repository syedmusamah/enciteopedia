class AddCategoryToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :Category, :string
  end
end
