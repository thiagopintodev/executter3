class Follower < ActiveRecord::Base
  belongs_to :site
  belongs_to :other,  class_name: "Site", foreign_key: "other_id"
  belongs_to :follower_site,  class_name: "Site", foreign_key: "other_id"
end
