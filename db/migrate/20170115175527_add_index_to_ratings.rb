class AddIndexToRatings < ActiveRecord::Migration[5.0]
  def change
    add_index :ratings, [:agent_id, :user_id]
  end
end
