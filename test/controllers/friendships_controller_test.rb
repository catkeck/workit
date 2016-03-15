require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase

  test "adding friend should require user to be logged in" do
    assert_no_difference 'Friendship.count' do
      post :create
    end
    assert_redirected_to login_url
  end

  test "destroy should require user to be logged in" do
    assert no_difference 'Relationship.count' do
      delete :destroy, id: friendships(:one)
    end
    assert_redirected_to login_url
  end
end
