class Site < ActiveRecord::Base

  belongs_to :owner, polymorphic: true

  has_many :posts
  has_many :followers,
            class_name: "Relation", foreign_key: "follower_id"
  has_many :followings,
            class_name: "Relation", foreign_key: "following_id"
  has_many :friends, -> { where is_friend: true },
            class_name: "Relation", foreign_key: "following_id"

  def followings_posts
    site_ids = followings.pluck(:follower_id) + [id]
    Post.where(site_id: site_ids)
  end

  def follow!(other)
    other = case other.class.name
            when 'String'   then Site.find_it(other)
            # when 'Integer'  then raise "int"
            # when 'Site'     then raise "site"
            else raise "Follow argument has an unrecongnied type: #{other.class.name}"
            end
    
    followings.where(follower_id: other.id).first_or_initialize.tap do |r|
      r.is_active = true
      r.save!
    end
  end


  validates_uniqueness_of :permalink, case_sensitive: false

  def permalink=(permalink)
    write_attribute(:permalink, permalink)
    self.downcased = permalink.downcase
  end

  def self.find_it(s)
    s1 = s.strip.downcase.delete("@")
    where(downcased: s1).first || "site_record_not_found_#{s}".to_sym
  end

  def to_param
    permalink
  end

  def at_permalink
    "@#{permalink}"
  end
end
