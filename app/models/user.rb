class User < ActiveRecord::Base

  include Authentication


  #VALIDATIONS

  validates :first_name,  presence: true, length: { in: 2..16 }
  validates :last_name,   presence: true, length: { in: 2..32 }
  validates :gender,      presence: true, inclusion: {in: USER_GENDERS}
  validates :born_on,     presence: true
  
  validates :username, presence: true, exclusion: { in: %w(admin superuser) }

  has_one :site, as: :owner, autosave: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def username=(username)
    self.site ||= build_site
    self.site.permalink=username
  end

  def username
    site.permalink if site
  end


  # gravatar


  def gravatar_uuid
    Digest::MD5.hexdigest(email.downcase)
  end

  def get_gravatar_photo(size=nil)
    return "http://www.gravatar.com/avatar/#{gravatar_uuid}?d=404"  if !size
    return "http://www.gravatar.com/avatar/#{gravatar_uuid}?d=404&s=#{size}"
  end

  def gravatar_or_default(size=nil)
    if gravatar_photo
      return size.nil? ? gravatar_photo : "#{gravatar_photo}?s=#{size}"
    end
    "/images/old_default_user_photo/original.png"
  end

  # {
  #   "entry"=>[
  #     {
  #       "id"=>"31891337",
  #       "hash"=>"6d9bb5ee597f62dcbfc76f76e6772ff8",
  #       "requestHash"=>"6d9bb5ee597f62dcbfc76f76e6772ff8",
  #       "profileUrl"=>"http://gravatar.com/yakkorails",
  #       "preferredUsername"=>"yakkorails",
  #       "thumbnailUrl"=>"http://0.gravatar.com/avatar/6d9bb5ee597f62dcbfc76f76e6772ff8",
  #       "photos"=>[
  #         {"value"=>"http://0.gravatar.com/avatar/6d9bb5ee597f62dcbfc76f76e6772ff8", "type"=>"thumbnail"}
  #       ],
  #       "name"=>[],
  #       "displayName"=>"yakkorails",
  #       "urls"=>[]
  #     }
  #   ]
  # }
  def gravatar_profile_hash
    Rails.cache.fetch([:gravatar, gravatar_uuid]) {
      url = "http://www.gravatar.com/#{gravatar_uuid}.json"
      s = open(url).read rescue nil # OpenURI::HTTPError
      JSON.parse s if s
    }
  end
  
end
