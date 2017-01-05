require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Test User", email: "email@email.com", password: "password")
    @user.save
    @agent = Agent.new(name: "Test Agent", suburb: "Nundah", user_id: @user.id)
  end

  test "agent should be valid" do
    @agent.save
    assert @agent.valid?
  end

  test "agent name should be present" do
    @agent.name = " "
    assert_not @agent.valid?
  end

  test "agent suburb should be present" do
    @agent.suburb = ""
    assert_not @agent.valid?
  end

  test "agent name should not be too long" do
    @agent.name = "aa"
    assert_not @agent.valid?
  end

  test "agent suburb should not be too long" do
    @agent.suburb = "ss"
    assert_not @agent.valid?
  end

  test "agent name should not be too short" do
    @agent.name = "morethanfiftycharactersmorethanfiftycharactersmorethanfiftycharacters"
    assert_not @agent.valid?
  end

  test "agent suburb should not be too short" do
    @agent.suburb = "morethanthirtycharactersmorethanthirtycharacters"
    assert_not @agent.valid?
  end

end