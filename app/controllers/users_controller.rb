class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      @user = User.authenticate(params[:user][:email], params[:user][:password])
      if @user
        flash[:notice] = "Welcome to the site!"
        session[:user_id] = @user.id
        redirect_to "/"
      # else
      #   flash[:alert] = "There was a problem logging you in."
      #   redirect_to log_in_path
      end
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
