class AddGenericTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :generic_token, :string
  end
end
