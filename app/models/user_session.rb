class UserSession < ActiveRecord::Base
  #TODO: tests don't directly involve user session
  belongs_to :user

  before_create do
    self.died_at = Time.now
  end

  def alive!
    update_attributes! :died_at, Time.now
  end
end
