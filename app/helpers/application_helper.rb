module ApplicationHelper

  def average_rating(agent)
    if agent.ratings.average(:star_rating)
      agent.ratings.average(:star_rating).round
    else
      0
    end
  end

  def number_of_ratings(agent)
    agent.ratings.size
  end
end
