class CreateThesisReviews < ActiveRecord::Migration
  def self.up
    create_table :thesis_reviews do |t|
      t.integer   :thesis_id, :null => false
      t.integer   :professor_id, :null => false
      t.text      :topic_relevance
      t.text      :brief_description, :limit => 500
      t.text      :layout_and_style
      t.text      :contributions
      t.text      :recommendations, :limit => 500
      t.text      :comments, :limit => 500
      t.text      :conclusion
      t.decimal   :assessment, :precision => 5, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :thesis_reviews
  end
end
