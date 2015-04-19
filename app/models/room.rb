class Room < ActiveRecord::Base
  attr_accessible :building, :capacity, :name, :tools
  validates :capacity, numericality: { only_integer: true }
  validates :name, :building, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  has_many :courses
end