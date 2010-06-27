# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100627144935) do

  create_table "professors", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theses", :force => true do |t|
    t.text     "title",              :null => false
    t.text     "annotation",         :null => false
    t.integer  "professor_id",       :null => false
    t.integer  "student_id",         :null => false
    t.integer  "thesis_proposal_id"
    t.date     "graduation_date"
    t.string   "thesis_file_name"
    t.string   "department"
    t.string   "faculty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thesis_proposal_comments", :force => true do |t|
    t.integer  "thesis_proposal_id",                :null => false
    t.integer  "professor_id",                      :null => false
    t.text     "description",        :limit => 500, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thesis_proposals", :force => true do |t|
    t.text     "title",                                   :null => false
    t.text     "annotation",                              :null => false
    t.text     "description",              :limit => 500, :null => false
    t.text     "programming_technologies",                :null => false
    t.integer  "execution_time",                          :null => false
    t.string   "consultant_name",                         :null => false
    t.integer  "professor_id",                            :null => false
    t.integer  "student_id",                              :null => false
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thesis_reviews", :force => true do |t|
    t.integer  "thesis_id",                                                      :null => false
    t.integer  "professor_id",                                                   :null => false
    t.text     "topic_relevance"
    t.text     "brief_description", :limit => 500
    t.text     "layout_and_style"
    t.text     "contributions"
    t.text     "recommendations",   :limit => 500
    t.text     "comments",          :limit => 500
    t.text     "conclusion"
    t.decimal  "assessment",                       :precision => 5, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
