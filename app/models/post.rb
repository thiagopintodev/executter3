class Post < ActiveRecord::Base
  belongs_to :site

  before_create do
    self.remote_ip = '0.0.0.0'
    self.files_categories = 'status'
  end

  def to_param
    "#{id}-#{body[0..30].parameterize}"
  end

end

#TODO: remove column user_id