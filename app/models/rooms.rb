class Rooms < ActiveRecord::Base
  attr_accessible :building, :capacity, :name, :tools
end
