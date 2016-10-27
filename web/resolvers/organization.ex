defmodule Skylab.Resolver.Organization do
  alias Absinthe.Relay.Connection
  alias Ecto.DateTime
  alias Skylab.{Organization, Person, Position, Repo}
  import Ecto.Query
  # import Skylab.Absinthe
  # use OkJose

  @moduledoc """
  Resolver for the Organization resource
  """

  def find(args, %{source: position}) do
    {:ok, Repo.get(Organization, position.organization_id)}
  end
end
