defmodule InspecApi.Repo.Migrations.CreateV1.AgentePublico do
  use Ecto.Migration

  def change do
    create table(:agentes_publicos) do
      add :nome, :string
      add :descricao, :string

      timestamps
    end

  end
end
