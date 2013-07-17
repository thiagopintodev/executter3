class CreateSites < ActiveRecord::Migration
  def up
    create_table :sites do |t|
      t.string :owner_type
      t.integer :owner_id
      t.string :link
      t.string :link_downcased

      t.timestamps
    end

    add_index "sites", ["owner_type", "owner_id"]
    add_index "sites", ["link"]

    u_count = User.count
    i = 0
    User.find_each do |user|
      uname = user.attributes['username']
      puts "#{i+=1} / #{u_count} | @#{uname}"
      while not user.create_site(link: uname).persisted?
        uname = "#{uname}#{rand(9999)}"
      end
    end
    remove_column :users, :username
  end

  def down
    drop_table :sites
    remove_index "sites", ["owner_type", "owner_id"]
    remove_index "sites", ["link"]
    add_column :users, :username, :string
  end
end
