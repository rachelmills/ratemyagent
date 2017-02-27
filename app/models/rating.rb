class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :agent, autosave: true

  validates :star_rating, presence: true,
            numericality: {
                only_integer: true,
                greater_than_or_equal_to: 1,
                less_than_or_equal_to: 5 }
  validates :rating_text, presence: true, length: { minimum: 10, maximum: 500 }
  validates :user_id, presence: true
  validates :agent_id, presence: true
  validates :agent, :presence => true, :uniqueness => { :scope => :user }

  def self.get_rating_for_agent_and_user(agent, user)
    Rating.find_by(agent: agent, user: user)
  end

  def self.get_average_rating_for_agent(agent, new_rating)
    num_ratings = agent.ratings.size
    if num_ratings == 0
      average_rating = new_rating.star_rating
    else
      average_rating = (agent.ratings.average(:star_rating) + new_rating.star_rating) / (num_ratings+1)
    end
    average_rating
  end
end
