class ThesisProposalComment < ActiveRecord::Base
  belongs_to :thesis_proposal
  belongs_to :professor

  validates_presence_of :thesis_proposal_id, :professor_id, :description
  validates_length_of :description, :within => 1..500
end
