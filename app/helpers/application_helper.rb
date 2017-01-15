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

  def remove_duplicates_from_suburbs(suburb_array)
    suburb_array.uniq
  end

  def sort_suburbs(suburb_array)
    suburb_array.sort
  end
end
