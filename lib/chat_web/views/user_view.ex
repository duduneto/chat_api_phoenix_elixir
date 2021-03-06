defmodule ChatWeb.UserView do
  use ChatWeb, :view
  alias ChatWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: nil}) do
    %{data: "User not Found"}
  end
  def render("user.json", params) do
    %{
        id: params.user.id,
        email: params.user.email
    }
  end
end
