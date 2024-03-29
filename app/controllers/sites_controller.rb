class SitesController < ApplicationController

  load_resource do
    before do
      @site = Site.find_it(params[:site_id])
      @relations = Relation.get_relations(me.site, @site) if me.present?
      permit_controller!
    end
  end

  # GET /:link
  def show
    @url = site_posts_path(format: 'json', before_id: 'xxx')

    @background_color = '#1D586D'
    
    #posts
    # @posts = @site.posts.limit(10)

    #@followers
    @followers        = @site.follower_sites.limit(17)
    @followers_count  = @site.followers.count

    #@followings
    @followings       = @site.following_sites.limit(10)
    @followings_count = @site.followings.count
  end

  # GET /:link/mentions
  def mentions
    @url = site_mentions_posts_path(format: 'json', before_id: 'xxx')
    
    @background_color = '#1D586D'
    #posts
    # @posts = @site.posts.limit(10)

    #@followers
    @followers        = @site.follower_sites.limit(17)
    @followers_count  = @site.followers.count

    #@followings
    @followings       = @site.following_sites.limit(10)
    @followings_count = @site.followings.count
    render 'show'
  end





  # GET /:link/follow
  def follow
    Relation.follow! @relations
    redirect_to @site, notice: "You are now following #{@site.owner.full_name}"
  end

  # GET /:link/unfollow
  def unfollow
    Relation.unfollow! @relations
    redirect_to @site, notice: "You no longer follow #{@site.owner.full_name}"
  end

  # GET /:link/posts.json?before=:before_id
  def posts
    @posts = @site.posts.limit(10).before(params[:before_id])
    render '/posts/_posts'
  end

  # GET /:link/mentions/posts.json?before=:before_id
  def mentions_posts
    @posts = @site.posts.limit(10).before(params[:before_id])
    render '/posts/_posts'
  end
end
