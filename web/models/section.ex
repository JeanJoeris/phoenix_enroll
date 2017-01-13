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
  alias DbExperiment.Repo

  schema "sections" do
    has_many :enrollments, DbExperiment.Enrollment
    belongs_to :course, DbExperiment.Course
    field :name, :string
    field :status, :string
    field :max_number_of_students, :integer
    field :start_date, :date
    field :end_date, :date
  end

  def program_id(section_id) do
    section = Repo.get(DbExperiment.Section, section_id)
    course = Repo.preload(section, :course).course
    course.program_id
  end

  def total_enrolled(section_id) do
    query = "SELECT enrollments.* FROM enrollments WHERE enrollments.section_id = #{section_id}"
    result = Ecto.Adapters.SQL.query(Repo, query, [])
    cols = Enum.map elem(result,1).columns, &(String.to_atom(&1))
    roles = Enum.map elem(result,1).rows, fn(row) ->
      struct(DbExperiment.Section, Enum.zip(cols, row))
    end
    length roles
  end
end
