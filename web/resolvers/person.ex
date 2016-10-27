defmodule Skylab.Resolver.Person do
  alias Absinthe.Relay.Connection
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
end
