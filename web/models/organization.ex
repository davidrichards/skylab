defmodule Skylab.Organization do
  use Skylab.Web, :model
  alias Skylab.{Position}

  schema "organizations" do
    field :name, :string
    has_many :positions, Position, on_delete: :nilify_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
