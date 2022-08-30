defmodule OrdigiWeb.PageController do
  use OrdigiWeb, :controller

  alias Ordigi.Notes

  def index(conn, _params) do
    pages = Notes.list_pages()
    render(conn, "index.html", pages: pages)
  end

  def create(conn, _) do
    {:ok, page} = Notes.create_page()

    conn
    |> put_flash(:info, "Page created successfully.")
    |> redirect(to: Routes.page_path(conn, :edit, page))
  end

  def edit(conn, %{"id" => id}) do
    page = Notes.get_page!(id)
    changeset = Notes.change_page(page)
    render(conn, "edit.html", page: page, changeset: changeset)
  end

  def update(conn, %{"id" => id, "page" => page_params}) do
    page = Notes.get_page!(id)

    case Notes.update_page(page, page_params) do
      {:ok, page} ->
        conn
        |> put_flash(:info, "Page updated successfully.")
        |> redirect(to: Routes.page_path(conn, :edit, page))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", page: page, changeset: changeset)
    end
  end
end
