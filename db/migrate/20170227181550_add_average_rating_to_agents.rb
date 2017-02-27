class AddAverageRatingToAgents < ActiveRecord::Migration[5.0]
  def change
    add_column :agents, :average_rating, :integer
  end
end
