class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    comment = Comment.create
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    user = current_user
    post_id = params[:comment]
    post = Post.find(post_id[:post_id])
    comment = Comment.new(comment_params)
    comment.author = user
    comment.post = post
    puts params[:post_id]

    if comment.save
      flash[:success] = 'Success: Your comment has been saved'
      redirect_to users_home_path
    else
      Comment.create
      flash[:error] = 'Error: Comment could not be saved'
      render :new, locals: { commet: }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
