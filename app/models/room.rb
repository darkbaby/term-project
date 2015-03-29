class Room < ActiveRecord::Base
  attr_accessible :building, :capacity, :name, :tools
  validates :capacity, numericality: { only_integer: true }
end
