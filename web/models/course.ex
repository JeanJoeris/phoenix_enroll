defmodule DbExperiment.Course do
  use DbExperiment.Web, :model
  alias DbExperiment.Repo
  alias DbExperiment.Section

  schema "courses" do
    field :name, :string
    field :created_at, :naive_datetime
    field :updated_at, :naive_datetime
    field :program_id, :integer
    has_many :sections, Section
    has_many :enrollments, through: [:sections, :enrollments]
  end

  def fetch_backend_sections do
    query = "SELECT sections.* FROM sections INNER JOIN courses ON sections.course_id = courses.id WHERE courses.name = 'Object-Oriented Programming' AND (start_date > '2017-01-12')  ORDER BY sections.start_date ASC limit 3"
    result = Ecto.Adapters.SQL.query(Repo, query, [])
    cols = Enum.map elem(result,1).columns, &(String.to_atom(&1))
    Enum.map elem(result,1).rows, fn(row) ->
      struct(Section, Enum.zip(cols, row))
    end
  end

  def fetch_frontend_sections do
    query = "SELECT sections.* FROM sections INNER JOIN courses ON sections.course_id = courses.id WHERE courses.name = 'Fundamental Web Technologies' AND (start_date > '2017-01-12')  ORDER BY sections.start_date ASC limit 3"
    result = Ecto.Adapters.SQL.query(DbExperiment.Repo, query, [])
    cols = Enum.map elem(result,1).columns, &(String.to_atom(&1))
    roles = Enum.map elem(result,1).rows, fn(row) ->
      struct(DbExperiment.Section, Enum.zip(cols, row))
    end
  end

  def fetch_next_sections do
    frontend_sections = fetch_frontend_sections
    backend_sections = fetch_backend_sections
    frontend_sections ++ backend_sections
  end
end
