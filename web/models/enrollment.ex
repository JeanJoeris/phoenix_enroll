# create_table "enrollments", force: :cascade do |t|
#   t.integer  "section_id"
#   t.integer  "student_id"
#   t.integer  "assessor_id"
#   t.datetime "assessment_date"
#   t.text     "assessment_notes"
#   t.boolean  "assessment_passed"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
defmodule DbExperiment.Enrollment do
  use DbExperiment.Web, :model

  schema "enrollments" do
    belongs_to :section, DbExperiment.Section
    field :student_id, :integer
    field :assessor_id, :integer
    field :assessment_date, :naive_datetime
    field :assessment_notes, :string
    field :assessment_passed, :boolean
    field :updated_at, :naive_datetime
    field :created_at, :naive_datetime
  end
end
