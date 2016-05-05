class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end
  def edit
    @user = User.find_by_id(params[:id])
  end
  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
  end
  def destroy
    @user = User.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :current_city, :image, :password)
  end

end
