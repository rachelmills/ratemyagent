require 'test_helper'

class CreateAgentsTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Test User", email: "email@email.com", password: "password")
    @agent = Agent.create(name: 'Test agent', suburb: 'Nundah', user_id: @user.id)
  end

  test 'get new agent form and create agent' do
    get new_agent_path
    assert_template 'agents/new'
    assert_difference 'Agents.count', 1 do
      post_via_redirect agents_path, agent: {name: 'Test agent', suburb: 'Nundah'}
    end
    assert_template 'agents/show'
    puts 'where am i'
    puts response.body
    assert_match "abcde", response.body
    assert_match "Nundah", response.body
  end
end