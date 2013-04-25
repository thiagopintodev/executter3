class Following < ActiveRecord::Base
  belongs_to :site
  belongs_to :other,  class_name: "Site", foreign_key: "other_id"
end
