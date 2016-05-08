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
      render :show
    else
      redirect_to root_path
    end
  end

end
