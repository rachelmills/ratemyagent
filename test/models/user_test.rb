require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'Test User', email: 'email@email.com', password: 'password')
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "username should be unique" do
    @user.save
    @user2 = User.new(username: "Test User", email: "email2@email.com", password: "password")
    assert_not @user2.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.save
    @user2 = User.new(username: "Test User2", email: "email@email.com", password: "password")
    assert_not @user2.valid?
  end

  test "password should be present" do
    @user3 = User.new(username: 'Test User', email: 'email@email.com')
    assert_not @user3.valid?
  end
end