require "test_helper"

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get sneaker" do
    get admin_homes_sneaker_url
    assert_response :success
  end
end
