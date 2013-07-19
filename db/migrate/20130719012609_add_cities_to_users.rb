class AddCitiesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city_living_name, :string
    add_column :users, :city_born_name, :string
  end
end
