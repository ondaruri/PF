require 'test_helper'

class Admins::PostRamensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_post_ramens_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_post_ramens_show_url
    assert_response :success
  end

  test "should get create" do
    get admins_post_ramens_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_post_ramens_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_post_ramens_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_post_ramens_destroy_url
    assert_response :success
  end

end
