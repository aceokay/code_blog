class PostsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @posts = Post.all
    @tags = Tag.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
   @post = Post.new
   @tags = Tag.all
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    tag_ids = params[:post][:tag]
    if @post.save
      if tag_ids != nil
        if tag_ids.length > 0
          tag_ids.each do |tag_id|
            tag = Tag.find(tag_id)
            @post.tags.push(tag)
          end
        end
      end
      redirect_to posts_path
    else
      flash[:notice] = "You must fill in all parts of the form."
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tags = Tag.all
  end

  def update
    @post = Post.find(params[:id])
    tag_ids = params[:post][:tag]
    if @post.update(post_params)
      if tag_ids == nil
        @post.tags.destroy_all()
      elsif tag_ids.length > 0
        tag_ids.each do |tag_id|
          tag = Tag.find(tag_id)
          @post.tags.push(tag)
        end
      end
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash[:notice] = "You must fill in all parts of the form."
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :tag)
  end
end
