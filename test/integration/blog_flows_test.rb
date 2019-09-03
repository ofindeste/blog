require 'test_helper'

class BlogFlowsTest < ActionDispatch::IntegrationTest
  test "Main page loads" do
    get "/"
    assert_select "h1", "Список новостей"
  end

  test "Post exists" do
    get "/posts/1"
    assert_response :success
  end
end
