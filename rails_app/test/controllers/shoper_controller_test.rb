require "test_helper"

class ShoperControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shoper_index_url
    assert_response :success
  end
end
