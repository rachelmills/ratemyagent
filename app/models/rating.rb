class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :agent

  validates :star_rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :rating_text, presence: true, length: {minimum: 10, maximum: 500}
  validates :user_id, presence: true
  validates :agent_id, presence: true
  end