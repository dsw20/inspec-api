defmodule InspecApi.Repo.Migrations.CreateV1.Relatorio do
  use Ecto.Migration

  def change do
    create table(:relatorios) do
      add :titulo, :string
      add :conteudo, :string

      timestamps
    end

  end
end
