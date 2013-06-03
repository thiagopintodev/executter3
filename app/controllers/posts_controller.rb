class PostsController < ApplicationController

  load_resource do
    before                                  {  }
    before(:index)                          { @posts = Post.all               }
    before(:new)                            { @post  = Post.new               }
    before(:create)                         { @post  = me.site.posts.build(post_params)  }
    before(:show, :edit, :update, :destroy) { @post  = Post.find(params[:id]) }
    after                                   { permit_controller! }
  end

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
    @post.remote_ip = request.remote_ip
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body)
    end

end
