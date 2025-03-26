require "test_helper"

class Public::SneakerBrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_sneaker_brands_index_url
    assert_response :success
  end
end
