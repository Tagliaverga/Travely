class AddFirstNameToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :contractor, :boolean, default: false
  end
end
