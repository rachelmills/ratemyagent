class Agent < ActiveRecord::Base
  has_many :ratings
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :suburb, presence: true, length: { minimum: 4 }
  validates :state, presence: true, length: { minimum: 2, maximum: 3 }
end
