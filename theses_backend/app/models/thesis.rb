class Thesis < ActiveRecord::Base
  belongs_to  :student
  belongs_to  :professor
  has_one     :thesis_proposal

  validates_presence_of :title, :annotation, :student_id, :professor_id
end
