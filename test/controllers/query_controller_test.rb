require 'test_helper'

class QueryControllerTest < ActionController::TestCase
  test "GET index" do
    get :index, format: :json
    assert_response :success
    assert_equal "application/json", response.content_type
  end

  test "GET index with sort param" do
    get :index, {sort: 'vkf', format: :json}
    assert_response :success
    assert_equal "application/json", response.content_type
  end

end
