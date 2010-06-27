class CreateTheses < ActiveRecord::Migration
  def self.up
    create_table :theses do |t|
      t.text        :title, :null => false
      t.text        :annotation, :null => false
      t.integer     :professor_id, :null => false
      t.integer     :student_id, :null => false
      t.integer     :thesis_proposal_id
      t.date        :graduation_date
      t.string      :thesis_file_name
      t.string      :department
      t.string      :faculty
      t.timestamps
    end
  end

  def self.down
    drop_table :theses
  end
end
