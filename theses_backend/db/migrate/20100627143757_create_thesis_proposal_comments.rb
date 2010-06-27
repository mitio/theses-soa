class CreateThesisProposalComments < ActiveRecord::Migration
  def self.up
    create_table :thesis_proposal_comments do |t|
      t.integer   :thesis_proposal_id, :null => false
      t.integer   :professor_id, :null => false
      t.text      :description, :null => false, :limit => 500

      t.timestamps
    end
  end

  def self.down
    drop_table :thesis_proposal_comments
  end
end
