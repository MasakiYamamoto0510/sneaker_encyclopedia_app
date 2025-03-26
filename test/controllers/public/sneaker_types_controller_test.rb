require "test_helper"

class Public::SneakerTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_sneaker_types_show_url
    assert_response :success
  end
end
