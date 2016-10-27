defmodule Skylab.Person do
  use Skylab.Web, :model
  alias Skylab.{Position}

  schema "people" do
    field :name, :string
    field :age, :integer
    has_many :positions, Position, on_delete: :nilify_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :age])
    |> validate_required([:name, :age])
  end
end
