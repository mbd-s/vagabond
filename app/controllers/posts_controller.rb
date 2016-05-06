class PostsController < ApplicationController
  before_filter :set_user

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      #@user.posts is an array
      @user.posts << post
    redirect_to user_path(@user)
    else
    flash[:error] = post.errors
    redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    redirect_to user_post_path(@user, post)
  end


  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
