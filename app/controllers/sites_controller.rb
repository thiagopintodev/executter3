class SitesController < ApplicationController

  load_resource do
    before do
      @site = Site.find_it(params[:site_id])
      @relations = Relation.get_relations(me.site, @site) if me.present?
      permit_controller!
    end
  end

  # GET /:permalink
  def show
    @posts = @site.followings_posts
  end

  # GET /:permalink/follow
  def follow
    Relation.follow! @relations
    redirect_to @site, notice: "You are now following #{@site.owner.full_name}"
  end

  # GET /:permalink/unfollow
  def unfollow
    Relation.unfollow! @relations
    redirect_to @site, notice: "You no longer follow #{@site.owner.full_name}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
end
