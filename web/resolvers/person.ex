defmodule Skylab.Resolver.Person do
  alias Absinthe.Relay.{Connection, Node}
  alias Ecto.DateTime
  alias Skylab.{Organization, Person, Position, Repo}
  import Ecto.Query
  # import Skylab.Absinthe
  # use OkJose

  @moduledoc """
  Resolver for the Person resource
  """

  def find(args, %{source: position}) do
    {:ok, Repo.get(Person, position.person_id)}
  end

  def update(%{person_id: id, name: name} = args, info) do
    {:ok, %{type: type, id: id}} = Node.from_global_id(id, Skylab.Schema)

    Person
    |> Repo.get(id)
    |> Person.changeset(%{name: name})
    |> Repo.update
  end
end
