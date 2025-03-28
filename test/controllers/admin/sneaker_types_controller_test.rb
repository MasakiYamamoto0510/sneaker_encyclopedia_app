require "test_helper"

class Admin::SneakerTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_sneaker_types_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_sneaker_types_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_sneaker_types_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_sneaker_types_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_sneaker_types_destroy_url
    assert_response :success
  end
end
