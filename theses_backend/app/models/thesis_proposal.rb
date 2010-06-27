class ThesisProposal < ActiveRecord::Base
  belongs_to :professor
  belongs_to :student

  validates_presence_of :title, :annotation, :description, :programming_technologies, :student_id, :professor_id, :consultant_name
  validates_inclusion_of :execution_time, :in => (1..70), :message => 'should be between 1 and 70 days'
  validates_length_of :description, :within => 1..500

  after_save :create_thesis_from_proposal

  def create_thesis_from_proposal
    unless accepted.nil?
      thesis = Thesis.find_by_thesis_proposal_id(id)
      if self.accepted == true
        thesis ||= Thesis.new
        thesis.update_attributes  :thesis_proposal_id => id, :title => title, :annotation => annotation, :student_id => student_id, :professor_id => professor_id
        thesis.save!
      else
        thesis.destroy if thesis
      end
    end
  end
end
