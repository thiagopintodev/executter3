class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.references :post, index: true
      t.references :site, index: true
      t.text :text
      t.string :verb
      t.string :origin,         default: Post::ORIGIN_WEB
      t.string :file
      t.string :remote_ip
      t.integer :likes_count,   default: 0
      t.integer :replies_count, default: 0

      t.timestamps
    end
    #
    puts "post-comments #{Post.where.not(post_id: nil).count}".red
    i=0
    Post.where.not(post_id: nil).each do |p_old|
      p = Post.find p_old.attributes['post_id']
      p.comments.create!  verb: Comment::VERB_COMMENTED,
                          text: p_old.attributes['text'],
                          site_id: p_old.site_id


      puts "comments #{i+=1}".yellow
    end
    puts "done #{Comment.count}".green
    Post.where.not(post_id: nil).delete_all
    Post.update_all verb: Post::VERB_POSTED
  end

  def down
    drop_table :comments
  end
end
