defmodule Skylab.PageController do
  use Skylab.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
