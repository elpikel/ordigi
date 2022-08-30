defmodule Ordigi.NotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ordigi.Notes` context.
  """

  @doc """
  Generate a page.
  """
  def page_fixture(attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        content: "some content"
      })

    {:ok, page} = Ordigi.Notes.create_page()
    {:ok, page} = Ordigi.Notes.update_page(page, attrs)

    page
  end
end
