defmodule ChatWeb.DefaultController do
  use ChatWeb, :controller

  def index(conn, _params) do
    text conn, "BusiApi!"
  end
end
