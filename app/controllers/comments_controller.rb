class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment made."
      redirect_to post_path(@post)
    else
      flash[:notice] = "Please try again, something went wrong."
      redirect_to new_post_comment_path(@post)
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted."
    redirect_to post_path(post)
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
