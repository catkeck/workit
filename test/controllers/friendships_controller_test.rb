require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase

  def setup
    @one = friendships(:one)
    @two = friendships(:two)
    @user = users(:caitlin)
  end

  #this test checks for user being properly logged in
  test "adding friend should require user to be logged in" do
    assert_no_difference 'Friendship.count' do
      post :create
    end
    assert_redirected_to login_url
  end

  test "destroy should require user to be logged in" do
    assert_no_difference 'Friendship.count' do
      delete :destroy, id: friendships(:one)
    end
    assert_redirected_to login_url
  end

  
  test "destroying friendship should make friendship count go down" do
    log_in_as(@user)
    count_friends = Friendship.count
    assert_difference('Friendship.count', -1) do
      @one.destroy
    end
  end

end
