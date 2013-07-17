class PostsRemoveOldColumns < ActiveRecord::Migration
  def change
    remove_column :posts, :post_id
    remove_column :posts, :user_id
    remove_column :posts, :image_file_name
    remove_column :posts, :image_content_type
    remove_column :posts, :image_file_size
    remove_column :posts, :image_updated_at
    remove_column :posts, :link_url
    remove_column :posts, :on_timeline
    remove_column :posts, :files_categories
    remove_column :posts, :files_extensions
    remove_column :posts, :posts_count
    remove_column :posts, :post_files_count
    remove_column :posts, :placement
    remove_column :posts, :generated_words
    remove_column :posts, :generated_notifications
  end
end
