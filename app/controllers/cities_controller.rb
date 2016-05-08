class CitiesController < ApplicationController
  def index
    @cities = City.all
    render :index
  end

  def show
    if current_user
      city_id = params[:id]
      @city = City.find_by(id: city_id)
      @post = @city.posts

      # newer
      @users = User.all
      @user = User.find(params[:id])
      users_post = @user.posts
      writter_id = users_post.find(params[:id])
      @writter = User.find(writter_id)



      render :show
    else
      redirect_to root_path
    end
  end

end
