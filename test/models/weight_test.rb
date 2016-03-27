require 'test_helper'

class WeightTest < ActiveSupport::TestCase

  def setup
    @weight = Weight.new(weight: 50, user_id: 5, date: Time.now)
  end

  test "should be valid" do
     assert @weight.valid?
  end

  test "name should be present" do
    @weight.weight = "   "
    assert_not @weight.valid?
  end

  test "user id should be present" do
    @weight.user_id = "     "
    assert_not @weight.valid?
  end

  test "date should be present" do
    @weight.date = "  "
    assert_not @weight.valid?
  end

end
