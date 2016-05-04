defmodule InspecApi.Repo.Migrations.CreateV1.OrgaoSuperior do
  use Ecto.Migration

  def change do
    create table(:orgaos_superiores) do
      add :nome, :string

      timestamps
    end

  end
end
