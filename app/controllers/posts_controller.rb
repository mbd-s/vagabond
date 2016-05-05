class PostsController < ApplicationController


  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
    redirect_to post_path(post)
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
  redirect_to post_path(post)
  end


  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
