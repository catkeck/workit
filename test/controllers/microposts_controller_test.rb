require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase

  def setup
    @micropost = microposts(:icecream)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post :create, micropost: { content: "Granola is yum"}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: @micropost
    end
    assert_redirected_to login_url
  end

  test "should stay on page after posting comment" do
    @user = User.find_by_id(5)
    log_in_as(users(:caitlin))
    Micropost.new(content: "boop de doop", friend_id: 5)
    assert_redirected_to @user
  end

end
