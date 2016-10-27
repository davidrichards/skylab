defmodule Skylab.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema
  # alias Juno.Resolver.{Authorization, Company, Device, Card, Transaction, User}
  alias Skylab.{Person, Repo}
  import_types Skylab.Schema.Types

  @moduledoc """
  Main Schema for querying/mutating data.
  """

  node interface do
    resolve_type fn
      %{title: _}, _ -> :position
      %{age: _}, _ -> :person
      %{name: _}, _ -> :organization
      _, _ -> nil
    end
  end

  query do
    @desc "Lookup a random root Person"
    field :random_person, :person do
      resolve fn(args, _info) ->
        people = Repo.all Person
        {:ok, Enum.random(people)}
      end
      # resolve &User.current/2
    end
  end
end
