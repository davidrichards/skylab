# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Juno.Repo.insert!(%Juno.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Skylab.DataBuilder do
  def create_organization(name) do
    Skylab.Repo.insert!(
      %Skylab.Organization{name: name}
    )
  end

  def assign_person(organization, age) do
    title = random_title
    name = random_first_name
    person = Skylab.Repo.insert!(
      %Skylab.Person{
        name: name,
        age: age
      }
    )
    Skylab.Repo.insert!(
      %Skylab.Position{
        organization_id: organization.id,
        person_id: person.id,
        title: title
      }
    )
    person
  end

  def random_first_name do
    Enum.random ~w(
      Noah Emma Liam Olivia Mason Sophia Jacob Ava William Isabella
      Ethan Mia James Abigail Alexander Emily Michael Charlotte Benjamin Harper
    )
  end

  def random_title do
    Enum.random ~w(Developer Designer Manager Assistant)
  end
end

Enum.each(~w(ACME Globex Soylent), fn(name) ->
  organization = Skylab.DataBuilder.create_organization(name)
  Enum.each(1..4, fn(i) ->
    Skylab.DataBuilder.assign_person(organization, i * 10)
  end)
end)
