require 'test_helper'

class FlicksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flicks_index_url
    assert_response :success
  end

end
