require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase

  def setup
    @one = friendships(:one)
    @two = friendships(:two)
    @user = users(:caitlin)
    @friend = users(:rei)
  end

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
    friendships(:one).destroy
    assert count_friends -= 1
  end

  test "adding friendship should make friendship count go up" do
    log_in_as(@user)
    count_friends = Friendship.count
    @user.friendships.build(:friend_id => @friend.id)
    assert count_friends += 1
  end
end
