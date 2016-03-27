require 'test_helper'

class WeightsControllerTest < ActionController::TestCase
  def setup
    @one = weights(:one)
    @two = weights(:two)
  end

test "should redirect create when not logged in" do
    assert_no_difference 'Weight.count' do
      post :create
    end
    assert_redirected_to login_url
  end

  test "should add new weight when logged in" do
    log_in_as(users(:caitlin))
    assert_difference 'Weight.count' do
      post :create, weight: {weight: 150, user_id: 1, date: Time.now}
    end
  end
end
