require 'test_helper'

class FindAgentsTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: 'Test User', email: 'email@email.com', password: 'password')
    @agent = Agent.create(name: 'Agent one', suburb: 'Nundah', user_id: @user.id, state: 'QLD')
    @agent = Agent.create(name: 'Agent two', suburb: 'New Farm', user_id: @user.id, state: 'QLD')
    @agent = Agent.create(name: 'Agent three', suburb: 'Chippendale', user_id: @user.id, state: 'NSW')
  end

  test 'get search form and find agent by name' do
    sign_in_as(@user, 'password')
    get find_path
    assert_template 'agents/find'
    get agents_path, params: { by_name: 'Agent one'}
    assert_template 'agents/index'
    assert_match 'Agent one', response.body
    refute_match 'Agent two', response.body
  end

  test 'get search form and find agent by suburb' do
    sign_in_as(@user, 'password')
    get find_path
    assert_template 'agents/find'
    get agents_path, params: { by_suburb: 'New Farm'}
    assert_template 'agents/index'
    assert_match 'Agent two', response.body
    refute_match 'Agent one', response.body
  end

  test 'get search form and find agent by state' do
    sign_in_as(@user, 'password')
    get find_path
    assert_template 'agents/find'
    get agents_path, params: { by_state: 'QLD'}
    assert_template 'agents/index'
    assert_match 'QLD', response.body
    refute_match 'NSW', response.body
  end

  test 'find agent by name and state' do
    sign_in_as(@user, 'password')
    get find_path
    assert_template 'agents/find'
    get agents_path, params: { by_name: 'Agent two', by_state: 'QLD'}
    assert_template 'agents/index'
    assert_match ', QLD', response.body
    refute_match ', NSW', response.body
  end

  test 'does not return agents that do not meet criteria' do
    sign_in_as(@user, 'password')
    get find_path
    assert_template 'agents/find'
    get agents_path, params: { by_name: 'Agent two', by_state: 'NSW'}
    assert_template 'agents/index'
    refute_match ', QLD', response.body
    refute_match ', NSW', response.body
  end

end
