class Student < ActiveRecord::Base
  has_many :thesis_proposals

  validates_presence_of :name
  attr_accessible :name
end
