defmodule InspecApi.Repo.Migrations.CreateV1.AbaixoAssinado do
  use Ecto.Migration

  def change do
    create table(:abasixo_assinados) do
      add :nome, :string
      add :descricao, :string
      add :status, :string

      timestamps
    end

  end
end
