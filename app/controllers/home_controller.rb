class HomeController < ApplicationController
  permit_controller!

  # GET /sign_out
  def sign_out
    session.clear
    redirect_to sign_in_path, notice: "You have signed out."
  end

  def index
    @site = me.site
    @posts = @site.followings_posts
  end

end
