class Post < ActiveRecord::Base
  belongs_to :site

  has_many :comments

  validates :site_id, presence: true
  validates :text, presence: true, length: { in: 2..196 }
  validates :verb, presence: true


  before_create do
    self.remote_ip ||= '0.0.0.0'
  end

  def to_param
    "#{id}-#{text[0..30].parameterize}"
  end

  VERB_POSTED = 'posted'

  ORIGIN_WEB = 'web'
  ORIGIN_MOBILE = 'mobile'

end
