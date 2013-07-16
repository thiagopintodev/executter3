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

  
end
