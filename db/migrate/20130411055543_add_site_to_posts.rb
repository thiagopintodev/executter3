class AddSiteToPosts < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.references :site, index: true
    end

    p_count = Post.count
    i = 0
    Post.find_each do |p|
    #Post.limit(500).each do |p|
      u = User.find p.attributes['user_id']
      s = u.site

      puts "#{i+=1} / #{p_count} | ##{p.id} @#{s.permalink}"
      p.update! site_id: s.id
    end
  end

  def down
    remove_column :posts, :site_id
  end
end
