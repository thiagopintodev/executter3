class HomeController < ApplicationController
  permit_controller!

  def index
    @site = me.site
    @posts = @site.followings_posts
  end

end
