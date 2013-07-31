class AddLastActivityAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_activity_at, :datetime
    User.update_all last_activity_at: 2.years.ago
  end
end
