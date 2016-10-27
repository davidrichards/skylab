defmodule Skylab.PositionTest do
  use Skylab.ModelCase

  alias Skylab.Position

  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Position.changeset(%Position{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Position.changeset(%Position{}, @invalid_attrs)
    refute changeset.valid?
  end
end
