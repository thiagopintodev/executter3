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
    @posts = @site.followings_posts.limit(10)
    #@followers        = @site.followers.limit(17).map(&:other)
    @followers        = @site.follower_sites.limit(17)
    @followers_count  = @site.followers.count

    #@followings       = @site.followings.limit(10).map(&:other)
    @followings       = @site.following_sites.limit(10)
    @followings_count = @site.followings.count
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

end
