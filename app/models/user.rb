class User < ActiveRecord::Base

  attr_accessor :link

  delegate :link, :link=, :l_,
           to: :site,
           prefix: true

  alias :link :site_link
  alias :link= :site_link=
  alias :l_ :site_l_

  include Authentication


  #VALIDATIONS

  validates :first_name,  presence: true, length: { in: 2..16 }
  validates :last_name,   presence: true, length: { in: 2..32 }
  validates :gender,      presence: true, inclusion: {in: USER_GENDERS}
  validates :born_on,     presence: true
  
  validates :link, presence: true, exclusion: { in: %w(admin superuser) }
  validates :site, presence: true

  has_one :site, as: :owner

  def full_name
    "#{first_name} #{last_name}"
  end

  def site
    association(:site).reader || association(:site).build
  end



  
end
