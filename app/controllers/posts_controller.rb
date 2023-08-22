class PostsController < ApplicationController
  # GET /users/1/posts
  def index
    @user = User.find(params[:user_id])
  end

  # GET /users/1/posts/10
  def show
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
  end
end
