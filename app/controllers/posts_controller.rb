class PostsController < ApplicationController
  before_action :set_post
  before_action :authorize_post!

  # # GET /posts
  # def index
  # end

  # GET /posts/1
  def show
  end

  # # GET /posts/new
  # def new
  # end

  # # GET /posts/1/edit
  # def edit
  # end

  # POST /posts
  def create
    if @post.save
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  # # PATCH/PUT /posts/1
  # def update
  #   if @post.update(post_params)
  #     redirect_to @post, notice: 'Post was successfully updated.'
  #   else
  #     render action: 'edit'
  #   end
  # end

  # # DELETE /posts/1
  # def destroy
  #   @post.destroy
  #   redirect_to posts_url, notice: 'Post was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      case action_name
        when *%w(index)
          @posts = Post.all


        when *%w(new)
          @post = Post.new


        when *%w(create)
          @post = me.site.posts.build(post_params)


        when *%w(show edit update destroy)
          @post = Post.find(params[:id])


        else
          raise "this filter should not be placed for '#{action_name}' action" 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body)
    end

    def authorize_post!
      case action_name
        # when *%w(index)
        #   deny!

        # when *%w(new)
        #   deny!

        when *%w(create)
          deny! if me.nil?


        when *%w(show)
          #public page

        # when *%w(edit update destroy)
        #   deny!


        else
          raise "this filter should not be placed for '#{action_name}' action" 
      end
      
    end
end
