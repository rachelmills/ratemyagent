require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "Test User", email: "email@email.com", password: "password")
    @state = State.create(state_name: "Queensland")
    @suburb = Suburb.create(suburb_name: "Nundah", state_id: @state.id)
    @agent = Agent.new(name: "Test Agent", suburb: @suburb, user_id: @user.id, state: @state)
  end

  test "agent should be valid" do
    @agent.save
    assert @agent.valid?
  end

  test "agent name should be present" do
    @agent.name = ""
    assert_not @agent.valid?
  end

  test "user_id should be presnet" do
    @agent.user_id = ''
    assert_not @agent.valid?
  end

  test "suburb_id should be present" do
    @agent.suburb_id = ""
    assert_not @agent.valid?
  end

  test "state_id should be present" do
    @agent.state_id = ""
    assert_not @agent.valid?
  end

  test "name should not be too long" do
    @agent.name = 'aa'
    assert_not @agent.valid?
  end

  test "name should not be too short" do
    @agent.name = 'morethanfiftycharactersmorethanfiftycharactersmorethanfiftycharacters'
    assert_not @agent.valid?
  end

end