class AddRemoteIpTokenToUserSessions < ActiveRecord::Migration
  def change
    add_column :user_sessions, :origin, :string
    add_column :user_sessions, :remote_ip, :string
    add_column :user_sessions, :user_agent, :string
    add_column :user_sessions, :died_at, :datetime
  end
end
