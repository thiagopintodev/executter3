class Relation < ActiveRecord::Base

  #the one who clicked follow
  belongs_to :follower,   class_name: "Site", foreign_key: "follower_id"
  
  #the one who was followed
  belongs_to :following,  class_name: "Site", foreign_key: "following_id"
end
