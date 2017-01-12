# create_table "sections", force: :cascade do |t|
#     t.string   "name",                   limit: 255, default: ""
#     t.integer  "course_id"
#     t.string   "status",                 limit: 255, default: "open"
#     t.integer  "max_number_of_students",             default: 28
#     t.date     "start_date"
#     t.date     "end_date"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end
defmodule DbExperiment.Section do
  use DbExperiment.Web, :model

  schema "sections" do
    field :name, :string
    field :course_id, :integer
    field :status, :string
    field :max_number_of_students, :integer
    field :start_date, :date
    field :end_date, :date
  end
end
