class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end

  def new
   @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to posts_path
    else
      flash[:notice] = "Please fill the Category field"
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    render :edit
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to posts_path
    else
      flash[:notice] = "Please fill the Category field"
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to posts_path
  end

  private
  def tag_params
    params.require(:tag).permit(:category)
  end
end
