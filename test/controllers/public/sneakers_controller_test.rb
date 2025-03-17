require "test_helper"

class Public::SneakersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_sneakers_new_url
    assert_response :success
  end

  test "should get create" do
    get public_sneakers_create_url
    assert_response :success
  end
end
