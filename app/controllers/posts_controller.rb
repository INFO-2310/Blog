class PostsController < ApplicationController
  include SessionsHelper
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post
  end

#  def show
#    @post = Post.includes([:comments => :user]).find(params[:id])
#    @comment = Comment.new
#    curr_user = current_user
#    @user_name = curr_user.name
#    @post_id = @post.id
#  end
  
  def test
  end

  def edit
    @post = Post.find(params[:id])
  end

  def append_feed
    @posts = Post.where("user_id = ? AND created_at < ?", current_user.id, params[:time].to_time)[params[:current_length].to_i,20]
    render partial: 'posts/index'
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
