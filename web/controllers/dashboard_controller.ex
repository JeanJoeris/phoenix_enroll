defmodule DbExperiment.DashboardController do
  use DbExperiment.Web, :controller

  alias DbExperiment.Course
  alias DbExperiment.Section

  def index(conn, _params) do
    sections = Course.fetch_next_sections
    render conn, "index.json", sections: sections
  end
end
