require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def setup
    @friendship = friendships(:one)
  end

  test "should be valid" do
    assert @friendship.valid?
  end

  test "user id should be present" do
    @friendship.user_id = nil
    assert_not @friendship.valid?
  end

  test "friend id should be present" do
    @friendship.friend_id = "  "
    assert_not @friendship.valid?
  end
end
