defmodule DbExperiment.Course do
  use DbExperiment.Web, :model

  schema "courses" do
    field :name, :string
    # field :created_at, :datetime
    # field :updated_at, :datetime
    field :program_id, :integer
  end
end
