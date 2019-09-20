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
    @favorite = current_user.favorite_reviews.find_by(review_id: params[:id])
  end

  def edit
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = current_user.reviews.build(review_params)
    @review.movie_id = @movie.id
    @review.save
    redirect_to review_path(@review)
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
