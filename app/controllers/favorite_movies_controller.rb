class FavoriteMoviesController < ApplicationController
  def create
    favorite = current_user.favorite_movies.create(movie_id: params[:movie_id])
    redirect_to movies_url, notice: "#{favorite.movie.title}お気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorite_movies.find_by(movie_id: params[:id]).destroy
    redirect_to movies_url, notice: "#{favorite.movie.title}をお気に入り解除しました"
  end
end
