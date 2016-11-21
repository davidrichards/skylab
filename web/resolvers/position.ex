defmodule Skylab.Resolver.Position do
  alias Absinthe.Relay.Connection
  alias Ecto.DateTime
  alias Skylab.{Organization, Person, Position, Repo}
  import Ecto.Query

  @moduledoc """
  Resolver for the Position resource
  """

  def all(args, %{source: %Person{} = person}) do
    query = from po in Position,
      where: po.person_id == ^person.id
    {:ok, Connection.from_list(Repo.all(query), args)}
  end
  def all(args, %{source: %Organization{} = organization}) do
    query = from po in Position,
      where: po.organization_id == ^organization.id
    {:ok, Connection.from_list(Repo.all(query), args)}
  end
end
