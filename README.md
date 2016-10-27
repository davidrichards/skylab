# Skylab

Demonstrate how to use GraphQL and Relay in a Phoenix application.

GraphQL is an awesome technology for querying services for data, often times complimenting/replacing REST. Github recently launched a GraphQL API for [their service](https://developer.github.com/early-access/graphql/) in an effort to make integrations with Github more flexible.

GraphQL defines a schema that describes our data model.  We associate functions to that schema to resolve any data to retrive or mutate.

Relay was written [by Facebook](https://facebook.github.io/relay/) to communicate efficiently to the GraphQL server.

A more-thorough introducton to these technologies can be found [on my blog](#).

For our implementation, we rely on [Absinthe](#), [Absinthe Relay](#) and [Absinthe Plug](#). Together, these provide the tools to produce the GraphQL as well as test our server in the browser.

We also use `/web/schema.ex` and `/web/schema/types.ex` to define our schema.  We resolve data queries and mutations in `/web/resolvers.`  I've decided to implement a few data models:

* Person has many Positions
* Position belongs to Person and Organization
* Organization has many Positions

This creates a generic-enough schema that allows us to exercise a few ideas.

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
