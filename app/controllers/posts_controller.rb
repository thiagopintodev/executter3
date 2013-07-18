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
  # POST /posts.json
  def create
    @post.remote_ip = request.remote_ip
    @post.verb      = Post::VERB_POSTED

    respond_to do |format|
      if @post.save
        format.html { redirect_to home_path, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /posts/1
  # # PATCH/PUT /posts/1.json
  # def update
  #   respond_to do |format|
  #     if @post.update(post_params)
  #       format.html { redirect_to @post, notice: 'Post was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:text)
    end

end
