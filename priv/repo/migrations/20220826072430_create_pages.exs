defmodule Ordigi.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :content, :string

      timestamps()
    end
  end
end
