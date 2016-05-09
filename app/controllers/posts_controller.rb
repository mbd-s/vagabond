class PostsController < ApplicationController
  #before_filter :set_user, except: [:index, :new, :create]

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
      flash[:notice] = "Post saved to " + @city.name
    else
      flash[:error] = post.errors.full_messages.join(", ")
      redirect_to new_city_post_path
    end
  end

  def show
    if current_user
      @post = Post.find(params[:id])
      post_city_id = @post.city_id
      @post_city = City.find(post_city_id)
      user_id = @post.user_id
      @author = User.find(user_id)
      user_city_id = @author.city_id
      @user_city = City.find(user_city_id).name
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    flash[:notice] = "Successfully updated post."
    redirect_to user_post_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully deleted post."
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
