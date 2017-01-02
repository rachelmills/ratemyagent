class Agent < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :suburb, presence: true, length: {minimum: 3, maximum: 30}
end