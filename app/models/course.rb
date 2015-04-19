class Course < ActiveRecord::Base
  attr_accessible :cname, :day, :rname, :time
    validates :cname, :rname, presence: true
    belongs_to :room
end
