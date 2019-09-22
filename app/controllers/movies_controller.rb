class MoviesController < ApplicationController
  before_action :authenticate_user!
    PER = 8

  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true)
    @movies.page(params[:page]).per(PER)
    @movies = Movie.all.page(params[:page]).per(PER)
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
    @favorite = current_user.favorite_movies.find_by(movie_id: params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    # @movie.movie_categories.build
    @movie.save
    redirect_to movies_path
  end

  def update
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :image, :watched_by, category_ids: [])
  end
end
