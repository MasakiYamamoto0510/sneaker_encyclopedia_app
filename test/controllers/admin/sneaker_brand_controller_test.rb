require "test_helper"

class Admin::SneakerBrandControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_sneaker_brand_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_sneaker_brand_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_sneaker_brand_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_sneaker_brand_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_sneaker_brand_destroy_url
    assert_response :success
  end
end
