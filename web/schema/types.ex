defmodule Skylab.Schema.Types do
  alias Absinthe.Relay.Connection
  alias Skylab.Resolver.{Organization, Person, Position}
  require Logger
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation
  use Timex

  @moduledoc """
  Graphql Types
  """

  scalar :time, description: "ISOz time" do
    parse fn(timestamp) ->
      {:ok, datetime} = Timex.parse(timestamp, "{s-epoch}")
      datetime
    end
    serialize fn(datetime) ->
      {:ok, timestamp} = Timex.format(datetime, "{s-epoch}")
      String.to_integer(timestamp)
    end
  end

  node object :person do
    field :name, :string
    field :age, :integer

    connection field :positions, node_type: :position do
      arg :search, :string
      resolve &Position.all/2
    end
  end

  node object :position do
    field :title, :string
    field :person, :person do
      resolve &Person.find/2
    end
    field :organization, :organization do
      resolve &Organization.find/2
    end
  end

  node object :organization do
    field :name, :string
    connection field :positions, node_type: :position do
      arg :search, :string
      resolve &Position.all/2
    end
  end

  connection node_type: :position
end
