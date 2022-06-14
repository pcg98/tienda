require "test_helper"

class TarjetumsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tarjetums_create_url
    assert_response :success
  end

  test "should get show" do
    get tarjetums_show_url
    assert_response :success
  end

  test "should get update" do
    get tarjetums_update_url
    assert_response :success
  end

  test "should get edit" do
    get tarjetums_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get tarjetums_destroy_url
    assert_response :success
  end

  test "should get index" do
    get tarjetums_index_url
    assert_response :success
  end
end
