class PostsController < ApplicationController
  # GET /users/1/posts
  def index
    @user = User.find(params[:user_id])
  end

  def new
    post = Post.create
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    user = current_user
    post = Post.new(params.require(:post).permit(:title, :text))

    post.author = user
    if post.save
      flash[:success] = 'Success: Your post has been saved'
      redirect_to users_home_path
    else
      post = Post.create
      flash[:error] = 'Error: Post could not be saved'
      render :new, locals: { post: }
    end
  end

  # GET /users/1/posts/10
  def show
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
  end
end
