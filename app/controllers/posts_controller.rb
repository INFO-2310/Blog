class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def test
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
