require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:caitlin)
    @user_visit = users(:rei)
  end

  test "micropost interface" do
    log_in_as(@user)
    get user_path(users(:caitlin))

    # Invalid submission
    assert_no_difference 'Micropost.count' do
      post microposts_path, micropost: { content: "" }
    end

    # Valid submission
    content = "God I want a waffle"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, micropost: { content: content }
    end

    assert_redirected_to user_path(users(:caitlin))
    follow_redirect!
    # Delete a post.
    #assert_select "God I want a waffle", text: 'delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # Visit a different user.
    get user_path(users(:rei))
    assert_select 'a', text: 'delete', count: 0
  end
end
