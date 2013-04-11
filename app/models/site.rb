class Site < ActiveRecord::Base

  belongs_to :owner, polymorphic: true

  validates_uniqueness_of :permalink, case_sensitive: false

  def permalink=(permalink)
    write_attribute(:permalink, permalink)
    self.downcased = permalink.downcase
  end

  def self.find_it(s)
    where(downcased: s.downcase.delete("@")).first
  end

  def to_param
    permalink
  end
end
