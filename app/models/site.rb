class Site < ActiveRecord::Base

  belongs_to :owner, polymorphic: true

  has_many :posts
  has_many :followers
  has_many :followings
  has_many :follower_sites,  through: :followers
  has_many :following_sites, through: :followings

  validates_presence_of :owner

  #-> { where is_active: true },
  #TODO: friends
  
  def followings_posts
    site_ids = followings.pluck(:other_id) + [id]
    Post.where(site_id: site_ids).order(id: :desc)
  end

  # this method is only used in test features, maybe should move to test logic
  # however, can be useful for the console
  def follow!(other)
    other = case other.class.name
            when 'String'   then Site.find_it(other)
            # when 'Integer'  then raise "int"
            # when 'Site'     then raise "site"
            else raise "Follow argument has an unrecongnied type: #{other.class.name}"
            end
    Relation.follow! Relation.get_relations(self, other)
  end


  validates_uniqueness_of :link, case_sensitive: false

  def link=(link)
    write_attribute(:link, link)
    self.link_downcased = link.downcase
  end

  def self.find_it(s)
    s1 = s.strip.downcase.delete("@")
    where(link_downcased: s1).first || "site_record_not_found_#{s}".to_sym
  end

  def to_param
    link
  end

  def l_
    "@#{link}"
  end

end
