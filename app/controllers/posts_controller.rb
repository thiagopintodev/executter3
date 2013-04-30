class PostsController < ApplicationController
  before_action :define_post

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
      redirect_to home_path, notice: 'Post was successfully created.'
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

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def define_post
      case action_name
        when *%w(index)
          @posts = Post.all
          deny! if cannot? Post, action_name


        when *%w(new)
          @post = Post.new


        when *%w(create)
          @post = me.site.posts.build(post_params)


        when *%w(show edit update destroy)
          @post = Post.find(params[:id])


        else
          raise "this filter should not be placed for '#{action_name}' action" 
      end
      
      deny! if cannot? @post, action_name
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body)
    end

end
