defmodule Skylab.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema
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
      resolve fn(_args, _info) ->
        person =
          Person
          |> Repo.all
          |> Enum.random

        {:ok, person}
      end
    end
  end

  mutation do
    payload field :update_person do
      input do
        field :person_id, :id
        field :name, :string
      end

      output do
        field :name, :string
      end

      resolve &Skylab.Resolver.Person.update/2
    end
  end
end
