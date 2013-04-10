class User < ActiveRecord::Base

  include SignIn


  #VALIDATIONS

  validates :first_name,  presence: true, length: { in: 2..16 }
  validates :last_name,   presence: true, length: { in: 2..32 }
  
  #validates :username, :exclusion => { :in => %w(admin superuser) }
  
end
