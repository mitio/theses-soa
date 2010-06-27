class CreateThesisProposals < ActiveRecord::Migration
  def self.up
    create_table :thesis_proposals do |t|
      t.text      :title, :null => false
      t.text      :annotation, :null => false
      t.text      :description, :null => false, :limit => 500
      t.text      :programming_technologies, :null => false
      t.integer   :execution_time, :null => false
      t.string    :consultant_name, :null => false
      t.integer   :professor_id, :null => false
      t.integer   :student_id, :null => false
      t.boolean   :accepted
      t.timestamps
    end
  end

  def self.down
    drop_table :thesis_proposals
  end
end
