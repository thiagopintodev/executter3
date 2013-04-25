class HomeController < ApplicationController
  before_filter :authorize!

  def index
    @site = me.site
    @posts = @site.followings_posts
  end

  private

  def authorize!
    redirect_to :root if me.nil?
  end
end
