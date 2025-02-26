require "test_helper"

class ExcavationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get excavations_new_url
    assert_response :success
  end

  test "should get create" do
    get excavations_create_url
    assert_response :success
  end
end
