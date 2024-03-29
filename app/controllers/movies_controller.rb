class MoviesController < ApplicationController
  before_action :authenticate_user!
    PER = 9

  def index
    @q = Movie.ransack(params[:q])
    if params[:q].present?
      @movies = @q.result(distinct: true).page(params[:page]).per(PER)
    else
      @movies = Movie.all.page(params[:page]).per(PER)
    end
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
    if @movie.save
      redirect_to movies_path(anchor: 'some-id')
    else
      render 'new'
    end
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
