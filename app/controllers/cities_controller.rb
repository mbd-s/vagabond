class CitiesController < ApplicationController

  def index
    @cities = City.all
    render :index
  end

  def show
    city_id = params[:id]
    @city = City.find_by(id: city_id)
    @posts = @city.posts
    render :show
  end

end
