class User < ActiveRecord::Base

  include SignIn


  #VALIDATIONS

  validates :first_name,  presence: true, length: { in: 2..16 }
  validates :last_name,   presence: true, length: { in: 2..32 }
  
  #validates :username, :exclusion => { :in => %w(admin superuser) }

  has_one :site, as: :owner, autosave: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def username=(username)
    site = self.site || build_site
    site.permalink=username
  end
  
end
