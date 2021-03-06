require 'test_helper'

class AgentsControllerTest < ActionController::TestCase
  def setup
    @user = User.create(username: 'Test User', email: 'email@email.com', password: 'password')
    @agent = Agent.create(name: 'Test agent', suburb: 'Nundah', user_id: @user.id, state: 'QLD')
  end

  test 'should get agents index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    # simulates a logged in user
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test 'should get show' do
    get(:show, params: { 'id': @agent.id })
    assert_response :success
  end

  test 'should find by name' do
    get(:find, params: { by_name: 'best'})
    assert_response :success
  end
end