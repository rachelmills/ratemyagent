class Suburb < ActiveRecord::Base
  belongs_to :state
  has_many :agents
end
