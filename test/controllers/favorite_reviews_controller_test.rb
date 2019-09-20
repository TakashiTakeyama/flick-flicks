require 'test_helper'

class FavoriteReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_reviews_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_reviews_destroy_url
    assert_response :success
  end

end
