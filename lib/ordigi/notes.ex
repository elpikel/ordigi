defmodule Ordigi.Notes do
  @moduledoc """
    Notes.
  """

  import Ecto.Query, warn: false
  alias Ordigi.Repo

  alias Ordigi.Notes.Page

  def list_pages do
    Repo.all(Page)
  end

  def get_page!(id), do: Repo.get!(Page, id)

  def create_page() do
    %Page{}
    |> Repo.insert()
  end

  def update_page(%Page{} = page, attrs) do
    page
    |> Page.changeset(attrs)
    |> Repo.update()
  end

  def change_page(%Page{} = page, attrs \\ %{}) do
    Page.changeset(page, attrs)
  end
end
