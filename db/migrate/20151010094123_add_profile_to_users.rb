class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :string
    add_column :users, :address, :string
  end
end
