class AddSitesToRelations < ActiveRecord::Migration
  def up
    change_table :relations do |t|
      t.references :follower, index: true
      t.references :following, index: true
      t.boolean :is_active, default: false
      t.boolean :is_friend, default: false
    end

    r_count = Relation.count
    i = 0
    Relation.find_each do |r|
    #Relation.limit(500).each do |r|
      u1 = User.find r.attributes['user_id']
      u2 = User.find r.attributes['user2_id']
      u1_follows_u2 = r.attributes['is_followed']
      u2_follows_u1 = r.attributes['is_follower']

      puts "#{i+=1} / #{r_count} | ##{r.id} : #{!!u1_follows_u2} : #{!!u1_follows_u2 && !!u2_follows_u1}"
      r.update! follower_id: u1.site.id,
               following_id: u2.site.id,
               is_active: !!u1_follows_u2,
               is_friend: (!!u1_follows_u2 && !!u2_follows_u1)
    end
  end

  def down
    remove_column :relations, :follower_id
    remove_column :relations, :following_id
    remove_column :relations, :is_active
    remove_column :relations, :is_friend
  end
end
