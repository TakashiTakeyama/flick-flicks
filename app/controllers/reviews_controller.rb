class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @review = Review.new
  end

  def show
  end

  def edit
  end

  def create
    @review = current_user.reviews.build(review_params)
    # binding.irb
    @review.save
    redirect_to movies_path
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
