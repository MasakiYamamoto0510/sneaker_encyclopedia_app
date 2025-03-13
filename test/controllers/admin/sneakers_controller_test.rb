require "test_helper"

class Admin::SneakersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_sneakers_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_sneakers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_sneakers_show_url
    assert_response :success
  end
end
