defmodule InspecApi.Repo.Migrations.CreateV1.Programa do
  use Ecto.Migration

  def change do
    create table(:programas) do
      add :codigo, :integer
      add :nome, :string

      timestamps
    end

  end
end
