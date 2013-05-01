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
      load_resource do
        before                                      {  }
        for_action(:index)                          { @posts = Post.all               }
        for_action(:new)                            { @post  = Post.new               }
        for_action(:create)                         { @post  = Post.new(post_params)  }
        for_action(:show, :edit, :update, :destroy) { @post  = Post.find(params[:id]) }
        after                                       {  }
      end

      if @post
        deny! if cannot? @post, action_name
      else
        deny! if cannot? Post, action_name
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body)
    end

end
