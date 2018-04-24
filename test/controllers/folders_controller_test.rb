require 'test_helper'

class FoldersControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get folders_view_url
    assert_response :success
  end

  test "should get add" do
    get folders_add_url
    assert_response :success
  end

  test "should get update" do
    get folders_update_url
    assert_response :success
  end

  test "should get delete" do
    get folders_delete_url
    assert_response :success
  end

  test "should get add_file" do
    get folders_add_file_url
    assert_response :success
  end

end
