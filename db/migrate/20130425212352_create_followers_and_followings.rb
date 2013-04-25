class CreateFollowersAndFollowings < ActiveRecord::Migration
  def up
    create_table :followers do |t|
      t.references :site, index: true
      t.references :other, index: true

      t.timestamps
    end
    create_table :followings do |t|
      t.references :site, index: true
      t.references :other, index: true

      t.timestamps
    end

    r_count = Relation.count
    i = 0
    Relation.find_each do |r|
    #Relation.limit(100).each do |r|
      i+=1
      u1 = User.find r.attributes['user_id']
      u2 = User.find r.attributes['user2_id']
      u1_follows_u2 = r.attributes['is_followed']
      u2_follows_u1 = r.attributes['is_follower']
      s1 = u1.site
      s2 = u2.site
      
      Relation.follow! Relation.get_relations(s1, s2) if u1_follows_u2
      Relation.follow! Relation.get_relations(s2, s1) if u2_follows_u1

      if i % 10 == 0
        puts "-"
        puts "#{i} / #{r_count} | ##{r.id}"
        puts "#{Following.count} Following.count | #{Follower.count} Follower.count"
      end

    end
  end

  def down
    drop_table :followers
    drop_table :followings
  end
end
