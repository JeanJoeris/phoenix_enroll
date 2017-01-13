defmodule DbExperiment.DashboardView do
  alias DbExperiment.Section

  def render("index.json", %{sections: sections}) do
    Enum.map(sections, &future_enrollment_json/1)
  end

  def future_enrollment_json(section) do
    %{
      section_name: section.name,
      start_date: date_string(section.start_date),
      program_id: Section.program_id(section.id),
      total_required: section.max_number_of_students,
      total_enrolled: Section.total_enrolled(section.id)
    }
  end

  def date_string({ year, month, day }) do
    "#{year}-#{month}-#{day}"
  end
end
