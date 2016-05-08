class UsersController < ApplicationController
  before_filter :set_user, except: [:index, :new, :create]
  before_filter :logged_in?, except: [:show, :new, :create]

  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def edit
    unless current_user == @user
      redirect_to user_path(current_user)
    end
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
    if current_user
      set_user
      @city = City.find(@user.city_id).name
      @posts = @user.posts
    else
      redirect_to root_path
    end
  end

  # Deleting user is a 'bonus' feature
  # def destroy
  #   @user = User.find_by_id(params[:id]).destroy
  #   redirect_to root_path
  # end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :image, :password, :city_id)
  end
  def set_user
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end
end
