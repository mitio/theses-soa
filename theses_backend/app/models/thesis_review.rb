class ThesisReview < ActiveRecord::Base
  belongs_to  :thesis
  belongs_to  :professor
  
  validates_length_of :brief_description, :recommendations, :comments, :within => 0..500
  validates_inclusion_of :assessment, :in => (2.0 .. 6.0)
end
