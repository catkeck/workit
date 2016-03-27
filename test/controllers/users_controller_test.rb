require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:caitlin)
    @other_user = users(:rei)
  end

#These tests are all testing that the correct pages are getting accessed here
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show when logged in" do
    log_in_as(@other_user)
    get :show, id: @user
    assert_response :success
  end

  test "should see friends page when logged in" do
    log_in_as(@other_user)
    get :friends
    assert_response :success
  end

  test "should see index page when logged in" do
    log_in_as(@user)
    get :index
    assert_response :success
  end

#These tests are all testing that pages are redirected properly when not logged in
  test "should redirect show when not logged in" do
    get :show, id: @user
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email} 
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { name: @user.name, email: @user.email}
    assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end

#This test is meant to check that a user was correctly destroyed
  test "number of users goes down by one when user is destroyed" do
    assert_difference 'User.count', -1 do
      @user.destroy
    end
  end 
end
