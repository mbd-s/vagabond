class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:error] = @user.errors
      redirect_to new_user_path
    end
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    set_user
    @city = City.find(@user.city_id).name
    @posts = @user.posts
  end

  # Deleting user is a 'bonus' feature
  # def destroy
  #   @user = User.find_by_id(params[:id]).destroy
  #   redirect_to root_path
  # end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar, :password, :city_id)
  end
  def set_user
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end
end
