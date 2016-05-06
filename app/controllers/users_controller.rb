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
    set_user
    @drop = cities_drop_down
  end
  def update
    set_user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    set_user
    @posts = @user.posts
  end

  def cities_drop_down
    arr = []
    @cities = City.all
    @cities.each do |c|
      arr.push(c.name)
    end
    arr
  end

  # Deleting user is a 'bonus' feature
  # def destroy
  #   @user = User.find_by_id(params[:id]).destroy
  #   redirect_to root_path
  # end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :current_city, :avatar, :password)
  end
  def set_user
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end
end
