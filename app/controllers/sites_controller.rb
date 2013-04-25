class SitesController < ApplicationController
  before_action :set_site
  before_action :authorize_site!

  # GET /:permalink
  def show
    @posts = @site.followings_posts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find_it(params[:site_id])
    end

    def authorize_site!
      
    end
end
