defmodule Ordigi.NotesTest do
  use Ordigi.DataCase

  alias Ordigi.Notes

  # to be deleted
  describe "pages" do
    alias Ordigi.Notes.Page

    import Ordigi.NotesFixtures

    @invalid_attrs %{content: nil}

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Notes.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Notes.get_page!(page.id) == page
    end

    test "create_page/1" do
      assert {:ok, %Page{} = page} = Notes.create_page()
      assert page.content == nil
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %Page{} = page} = Notes.update_page(page, update_attrs)
      assert page.content == "some updated content"
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_page(page, @invalid_attrs)
      assert page == Notes.get_page!(page.id)
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Notes.change_page(page)
    end
  end
end
