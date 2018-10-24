class RemovePayUrlFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :pay_url, :string
  end
end
