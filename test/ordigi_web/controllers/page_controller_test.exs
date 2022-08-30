defmodule OrdigiWeb.PageControllerTest do
  use OrdigiWeb.ConnCase

  import Ordigi.NotesFixtures

  @create_attrs %{content: "some content"}
  @update_attrs %{content: "some updated content"}
  @invalid_attrs %{content: nil}

  describe "index" do
    test "lists all pages", %{conn: conn} do
      conn = get(conn, Routes.page_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pages"
    end
  end

  describe "create page" do
    test "redirects to edit when data is valid", %{conn: conn} do
      conn = post(conn, Routes.page_path(conn, :create), page: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.page_path(conn, :edit, id)

      conn = get(conn, Routes.page_path(conn, :edit, id))
      assert html_response(conn, 200) =~ "Edit Page"
    end
  end

  describe "edit page" do
    setup [:create_page]

    test "renders form for editing chosen page", %{conn: conn, page: page} do
      conn = get(conn, Routes.page_path(conn, :edit, page))
      assert html_response(conn, 200) =~ "Edit Page"
    end
  end

  describe "update page" do
    setup [:create_page]

    test "redirects when data is valid", %{conn: conn, page: page} do
      conn = put(conn, Routes.page_path(conn, :update, page), page: @update_attrs)
      assert redirected_to(conn) == Routes.page_path(conn, :edit, page)

      conn = get(conn, Routes.page_path(conn, :edit, page))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, page: page} do
      conn = put(conn, Routes.page_path(conn, :update, page), page: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Page"
    end
  end

  defp create_page(_) do
    page = page_fixture()
    %{page: page}
  end
end
