require 'test_helper'

class UserTest < ActiveSupport::TestCase
 
  def setup
    @user = User.new(name: "Floober Doober", email: "flooble@gmail.com", password: "flurbledurble", password_confirmation: "flurbledurble")
  end

  test "should be valid" do
      assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 500
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"*500 + "@gmail.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[shroombao@gmail.com blurbledurble@yahoo.com A-H_B_X@foboo.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end  

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[shroombao@gmail,com foofashle@beepbeep..com blurbledurble_at_yahoo.com, ABZ@hotmail.]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved in lower case" do
    mixed_case_email = "FlOoBlEd00blE@gmaiL.COM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present and not blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "blooblah!!!!!!!", friend_id: 2)
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

end
