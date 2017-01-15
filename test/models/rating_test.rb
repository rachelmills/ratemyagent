require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: 'Test User', email: 'email@email.com', password: 'password')
    @agent = Agent.create(name: 'Test Agent', suburb: 'Nundah', user_id: @user.id, state: 'QLD')
    @rating = Rating.new(user: @user, agent: @agent, star_rating: 3, rating_text: 'Good agent')
  end

  test 'rating should be valid' do
    assert @rating.valid?
  end

  test 'user_id shoud be present' do
    @rating.user_id = ''
    @rating.agent_id = ''
    @rating.save
    assert_not @rating.valid?
  end

  test 'rating text should not be too short' do
    @rating.rating_text = "ab"
    assert_not @rating.valid?
  end

  test 'star rating should be between 1 and 5' do
    @rating.star_rating = 6
    assert_not @rating.valid?
  end
end
