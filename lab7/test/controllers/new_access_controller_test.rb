require "test_helper"

class NewAccessControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get new_access_login_url
    assert_response :success
  end

  test "should get authenticate" do
    get new_access_authenticate_url
    assert_response :success
  end

  test "should get logout" do
    get new_access_logout_url
    assert_response :success
  end
end
