class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @review = Review.new
    @movie = Movie.find(params[:format])
    @review.movie_id = @movie.id
  end

  def show
  end

  def edit
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = current_user.reviews.build(review_params)
    @review.movie_id = @movie.id
    if @review.save
      render :index
    end
    # redirect_to movies_path
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:impression)
  end
end
