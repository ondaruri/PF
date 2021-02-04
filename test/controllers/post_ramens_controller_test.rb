require 'test_helper'

class PostRamensControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get post_ramens_show_url
    assert_response :success
  end

  test "should get edit" do
    get post_ramens_edit_url
    assert_response :success
  end

  test "should get new" do
    get post_ramens_new_url
    assert_response :success
  end

  test "should get create" do
    get post_ramens_create_url
    assert_response :success
  end

  test "should get update" do
    get post_ramens_update_url
    assert_response :success
  end

  test "should get destroy" do
    get post_ramens_destroy_url
    assert_response :success
  end

  test "should get search" do
    get post_ramens_search_url
    assert_response :success
  end

end
