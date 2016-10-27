defmodule Skylab.Position do
  use Skylab.Web, :model

  schema "positions" do
    field :title, :string
    belongs_to :organization, Skylab.Organization
    belongs_to :person, Skylab.Person

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
