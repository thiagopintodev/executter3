class Post < ActiveRecord::Base
  belongs_to :site

  before_create do
    self.remote_ip = '0.0.0.0'
    self.files_categories = 'status'
  end

end
