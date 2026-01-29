require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "downcases and strips email_address" do
    user = User.new(email_address: " DOWNCASED@EXAMPLE.COM ")
    assert_equal("downcased@example.com", user.email_address)
  end

  test "strips name" do
    user = User.new(name: "  François  ")
    assert_equal("François", user.name)
  end

  test "validates name presence" do
    user = users(:one)
    user.name = nil
    assert_not user.valid?
    assert_includes user.errors[:name], "can't be blank"
  end

  test "validates slug presence" do
    user = users(:one)
    user.slug = nil
    assert_not user.valid?
    assert_includes user.errors[:slug], "can't be blank"
  end

  test "validates slug uniqueness" do
    user = users(:one)
    user.slug = users(:two).slug
    assert_not user.valid?
    assert_includes user.errors[:slug], "has already been taken"
  end

  test "validates slug not reserved" do
    user = users(:one)
    User::RESERVED_SLUGS.sample(3).each do |reserved|
      user.slug = reserved
      assert_not user.valid?
      assert_includes user.errors[:slug], "is reserved"
    end
  end
end
