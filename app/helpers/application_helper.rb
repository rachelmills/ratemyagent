module ApplicationHelper
  def number_of_ratings(agent)
    agent.ratings.size
  end

  def remove_duplicates_from_suburbs(suburb_array)
    suburb_array.uniq
  end

  def sort_suburbs(suburb_array)
    suburb_array.sort
  end

  def can_rate_this_agent?(agent, user)
    @rating = Rating.get_rating_for_agent_and_user(agent, user)
    if @rating
      false
    else
      true
    end
  end

  def sortable(column, title=nil)
    title ||= column.titleize
    if column == 'average_rating'
      direction = column == sort_column && sort_direction == 'desc' ? 'asc' : 'desc'
    else
      direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    end
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
