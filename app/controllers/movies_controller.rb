class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.new(movie_params)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movies_path
  end

  def update
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :image, :watched_by)
  end
end
