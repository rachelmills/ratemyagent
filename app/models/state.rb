class State < ActiveRecord::Base
  has_many :agents
  has_many :suburbs

  has_many :suburbs_by_name, -> { order(:suburb_name) }, class_name: 'Suburb'
end