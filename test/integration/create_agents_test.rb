require 'test_helper'

class CreateAgentsTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'Test User', email: 'email@email.com', password: 'password')
  end

  test 'get new agent form and create agent' do
    sign_in_as(@user, 'password')
    # get new_agent_path
    # assert_template 'agents/new'
    # assert_difference 'Agent.count', 1 do
    #   post agents_path, params: {agent: {name: 'Test agent', suburb: 'Nundah'}}
    #   follow_redirect!
    # end
    # assert_template 'agents/show'
    # assert_match 'Test agent', response.body
    # assert_match 'Nundah', response.body
  end
end