defmodule InspecApi.PageController do
  use InspecApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
