defmodule Ordigi.Notes.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :content, :string

    timestamps()
  end

  def changeset(page, attrs) do
    page
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
