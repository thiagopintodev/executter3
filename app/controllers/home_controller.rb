class HomeController < ApplicationController
  permit_controller!

  # GET /sign_out
  def sign_out
    session.clear
    redirect_to sign_in_path, notice: "You have signed out."
  end

  def index
    @site = me.site
    
    #posts
    @posts = @site.followings_posts.limit(10)

    #@followers
    @followers        = @site.follower_sites.limit(17)
    @followers_count  = @site.followers.count

    #@followings
    @followings       = @site.following_sites.limit(10)
    @followings_count = @site.followings.count
  end

end
