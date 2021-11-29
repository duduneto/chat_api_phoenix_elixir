defmodule Chat.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table("users") do
      add :username, :string
      add :email, :string
      add :password, :string
      add :google_id, :string

      timestamps()
    end
  end

  def down do
    drop(table("users"))
  end
end
