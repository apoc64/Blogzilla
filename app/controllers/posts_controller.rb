class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def index
    @posts = Post.all
  end

  def update
    if params[:like]
      post = Post.find(params[:id])
      post.inc(likes: 1)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
