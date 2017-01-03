class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :agent_id
      t.integer :star_rating
      t.text :review_text
      t.timestamps
    end
  end
end
