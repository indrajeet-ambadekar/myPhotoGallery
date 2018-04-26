require 'test_helper'

class PhotoControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get photo_view_url
    assert_response :success
  end

  test "should get add" do
    get photo_add_url
    assert_response :success
  end

  test "should get update" do
    get photo_update_url
    assert_response :success
  end

  test "should get delete" do
    get photo_delete_url
    assert_response :success
  end

end
