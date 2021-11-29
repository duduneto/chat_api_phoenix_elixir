defmodule ChatWeb.UserController do
  use ChatWeb, :controller

  alias Chat.Directory
  alias Chat.Directory.User

  action_fallback ChatWeb.FallbackController

  def login(conn, params) do
    user = Directory.get_user_by_email(params["email"], params["password"])
    IO.inspect(user)
    render(conn, "user.json", user: user)
  end

  def index(conn, _params) do
    users = Directory.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, user_params) do
    with {:ok, %User{} = user} <- Directory.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Directory.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Directory.get_user!(id)

    with {:ok, %User{} = user} <- Directory.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Directory.get_user!(id)

    with {:ok, %User{}} <- Directory.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
