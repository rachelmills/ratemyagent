require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: 'Test User', email: 'email@email.com', password: 'password')
    @agent = Agent.new(name: 'Test Agent', suburb: 'Nundah', user_id: @user.id, state: 'QLD')
  end

  test 'agent should be valid' do
    assert @agent.valid?
  end

  test 'agent name should be present' do
    @agent.name = ''
    assert_not @agent.valid?
  end

  test 'user_id should be presnet' do
    @agent.user_id = ''
    assert_not @agent.valid?
  end

  test 'suburb should be present' do
    @agent.suburb = ''
    assert_not @agent.valid?
  end

  test 'state should be present' do
    @agent.state = ''
    assert_not @agent.valid?
  end

  test 'state should be 2 or 3 characters' do
    @agent.state = 'A'
    assert_not @agent.valid?
    @agent.state = 'ABCD'
    assert_not @agent.valid?
  end

  test 'suburb should be longer than 3 characters' do
    @agent.suburb = 'Abc'
    assert_not @agent.valid?
  end

  test 'name should not be too long' do
    @agent.name = 'aa'
    assert_not @agent.valid?
  end

  test 'name should not be too short' do
    @agent.name = 'morethanfiftycharactersmorethanfiftycharactersmorethanfiftycharacters'
    assert_not @agent.valid?
  end

  test 'agent name and suburb should be unique' do
    @agent.save
    new_agent = Agent.new(name: 'Test Agent', suburb: 'Nundah', user_id: @user.id, state: 'QLD')
    assert_not new_agent.valid?
  end

  test 'agent name should be saved in uppercase' do
    @agent.save
    assert @agent.name == 'TEST AGENT'
  end
end
