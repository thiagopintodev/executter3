

class CommentsController < ApplicationController
  before_action :define_comment

  # GET /comments
  def index
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def define_comment

      load_resource do
        before                                      { # load your nested resource's parent here if you need one }
        for_action(:index)                          { @comments = Comment.all                }
        for_action(:new)                            { @comment  = Comment.new                }
        for_action(:create)                         { @comment  = Comment.new(comment_params) }
        for_action(:show, :edit, :update, :destroy) { @comment  = Comment.find(params[:id])  }
        after                                       { # run your authorization logic here if you need one }
      end
      
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params

      params.require(:comment).permit(:post_id, :site_id, :text, :file, :likes_count, :replies_count, :remote_ip, :origin, :reason)

    end
end

