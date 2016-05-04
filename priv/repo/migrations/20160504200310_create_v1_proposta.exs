defmodule InspecApi.Repo.Migrations.CreateV1.Proposta do
  use Ecto.Migration

  def change do
    create table(:propostas) do
      add :numero, :integer
      add :ano, :integer
      add :data_inclusao, :date

      timestamps
    end

  end
end
