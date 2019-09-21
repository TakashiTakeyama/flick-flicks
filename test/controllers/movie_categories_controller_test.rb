require 'test_helper'

class MovieCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movie_categories_create_url
    assert_response :success
  end

  test "should get destroy" do
    get movie_categories_destroy_url
    assert_response :success
  end

end
