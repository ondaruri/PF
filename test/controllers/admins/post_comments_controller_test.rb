require 'test_helper'

class Admins::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admins_post_comments_destroy_url
    assert_response :success
  end

end
