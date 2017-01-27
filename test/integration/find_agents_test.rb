require 'test_helper'

class FindAgentsTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: 'Test User', email: 'email@email.com', password: 'password')
    @agent = Agent.create(name: 'Agent one', suburb: 'Nundah', user_id: @user.id, state: 'QLD')
    @agent = Agent.create(name: 'Agent two', suburb: 'New Farm', user_id: @user.id, state: 'QLD')
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
end
