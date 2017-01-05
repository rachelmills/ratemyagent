class RenameReviewTextToRatingText < ActiveRecord::Migration[5.0]
  def change
    rename_column :ratings, :review_text, :rating_text
  end
end
