class AddDefaultValueToAgentAverageRating < ActiveRecord::Migration[5.0]
  def change
    change_column_default :agents, :average_rating, 0
  end
end
