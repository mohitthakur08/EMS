require "test_helper"

class StatusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get status_new_url
    assert_response :success
  end

  test "should get update" do
    get status_update_url
    assert_response :success
  end
end
