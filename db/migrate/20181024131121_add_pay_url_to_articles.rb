class AddPayUrlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :pay_url, :string
  end
end
