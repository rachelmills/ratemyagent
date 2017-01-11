class Agent < ActiveRecord::Base
  has_many :ratings
  belongs_to :user
  belongs_to :suburb
  belongs_to :state

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
end