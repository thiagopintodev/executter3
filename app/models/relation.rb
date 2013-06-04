class Relation < ActiveRecord::Base

  #the one who clicked follow
  # belongs_to :follower,   class_name: "Site", foreign_key: "follower_id"
  
  # #the one who was followed
  # belongs_to :following,  class_name: "Site", foreign_key: "following_id"

  class << self

    def follow!(relations)
      relations.following.save!
      relations.follower.save!
      # .tap do |f|
      #   #r.is_active = true
      #   #TODO: r.is_friend
      #   r.save!
      # end
    end

    def unfollow!(relations)
      relations.following.destroy!
      relations.follower.destroy!
      # .tap do |f|
      #   # r.is_active = false
      #   #TODO: r.is_friend
      #   r.save!
      # end
    end

    def get_relations(my_site, site)
      return if my_site == site
      # I am the owner of this relationship
      #
      # following   how I subscribed to them
      # follower    how they subscribed to me
      #
      # am_follower
      # am_followed
      #
      relations = {}

      relations.follower  = my_site.followings.where(other_id: site.id).first_or_initialize
      relations.following = site.followers.where(other_id: my_site.id).first_or_initialize

      relations.am_follower  = relations.following.persisted?
      # h.can_friend = h.is_follower and
      return relations
    end

  end


end


#TODO: create table friends
#TODO: drop table relations