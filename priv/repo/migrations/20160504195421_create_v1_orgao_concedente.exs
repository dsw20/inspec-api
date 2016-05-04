defmodule InspecApi.Repo.Migrations.CreateV1.OrgaoConcedente do
  use Ecto.Migration

  def change do
    create table(:orgaos_responsaveis) do
      add :codigo, :integer
      add :nome, :string
      add :responsavel_concedente, :string
      add :cod_responsavel, :integer
      add :cargo_responsavel, :string

      timestamps
    end

  end
end
