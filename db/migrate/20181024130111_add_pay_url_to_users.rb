class AddPayUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pay_url, :string
  end
end
