defmodule InspecApi.Repo.Migrations.CreateV1.ValorConvenio do
  use Ecto.Migration

  def change do
    create table(:valores_convenio) do
      add :valor_global, :float
      add :repasse_uniao, :float
      add :contrapartida_total, :float
      add :contrapartida_bens_servicos, :float
      add :valor_desenbolcado, :float
      add :valor_empenhado, :float

      timestamps
    end

  end
end
