class UsersController < ApplicationController
  # GET /
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  #GET /users/1/posts
  def posts
    @user = User.find(params[:user_id])
  end

  #GET /users/1/posts/10
  def show_post_by_id
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
  end
end
