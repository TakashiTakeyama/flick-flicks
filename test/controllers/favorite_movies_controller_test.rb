require 'test_helper'

class FavoriteMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_movies_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_movies_destroy_url
    assert_response :success
  end

end
