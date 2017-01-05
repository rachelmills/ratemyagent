class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :agent
  validates :user_id, presence: true
  validates :agent_id, presence: true
end