class FavoriteReviewsController < ApplicationController
  def create
    favorite = current_user.favorite_reviews.create(review_id: params[:review_id])
    redirect_to movies_url, notice: "#{favorite.review.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorite_reviews.find_by(id: params[:id]).destroy
    redirect_to movies_url, notice: "#{favorite.review.user.name}さんのブログをお気に入り解除しました"
  end
end
