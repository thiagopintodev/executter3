class PostsNewColumns < ActiveRecord::Migration
  def change
    rename_column :posts, :body, :text
    #
    add_column :posts, :comments_count, :integer, default: 0
    add_column :posts, :file, :string
    add_column :posts, :photo_url, :string
    add_column :posts, :verb, :string
  end
end
