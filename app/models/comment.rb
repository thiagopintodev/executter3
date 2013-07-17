class Comment < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :site
  validates :verb, presence: true


  before_create do
    self.remote_ip ||= '0.0.0.0'
  end


  VERB_COMMENTED = 'commented'
  #VERB_LIKED = 'liked'

end
