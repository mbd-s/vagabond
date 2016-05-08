class PostsController < ApplicationController
  before_filter :set_user, except: [:index, :new, :create]

  def new
    if current_user
      @post = Post.new
      @city = City.find(params[:city_id])
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def create
    post = Post.new(post_params)
    @city = City.find(params[:city_id])
    post.user = current_user
    post.city = @city
    if post.save
      redirect_to city_path(@city)
    else
      flash[:error] = @post.errors
      redirect_to new_post_path
    end
  end

  def show
    if current_user
      @post = Post.find(params[:id])
      user_id = @post.user_id
      @author = User.find(user_id)
    else
      redirect_to root_path
    end
  end

  def edit
    if current_user == @user
      @post = Post.find(params[:id])
      city_id = params[:id]
      @city = City.find_by(id: city_id)
    else
      redirect_to root_path
    end
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    redirect_to city_post_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully deleted"
    redirect_to user_path(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :city_id, :user_id)
  end

  def set_user
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end
end
