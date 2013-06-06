class AddGravatarPhotoToUsers < ActiveRecord::Migration
  def up
    add_column :users, :gravatar_photo, :string

    User.find_each(batch_size: User.count/10) do |u|
      if u.gravatar_profile_hash.present?
        url = u.get_gravatar_photo
        #puts "#{u.id} #{url}".light_red
        if (open(url) rescue nil)
          #puts "#{u.id} #{url}".light_green
          url = url.gsub('?d=404', '')
          u.update_attributes!(gravatar_photo: url)
        end
      end
    end

  end

  def down
    remove_column :users, :gravatar_photo
  end
end
