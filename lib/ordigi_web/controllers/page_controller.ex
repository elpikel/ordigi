defmodule OrdigiWeb.PageController do
  use OrdigiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
