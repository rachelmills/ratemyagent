class RenameReviewsToRatings < ActiveRecord::Migration[5.0]
  def change
    rename_table :reviews, :ratings
  end
end
