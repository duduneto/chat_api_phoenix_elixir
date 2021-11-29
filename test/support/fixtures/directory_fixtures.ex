defmodule Chat.DirectoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chat.Directory` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{

      })
      |> Chat.Directory.create_user()

    user
  end

  @doc """
  Generate a business.
  """
  def business_fixture(attrs \\ %{}) do
    {:ok, business} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        tag: "some tag"
      })
      |> Chat.Directory.create_business()

    business
  end
end
