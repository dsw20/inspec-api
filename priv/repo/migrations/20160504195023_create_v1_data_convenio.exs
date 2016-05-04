defmodule InspecApi.Repo.Migrations.CreateV1.DataConvenio do
  use Ecto.Migration

  def change do
    create table(:datas_convenio) do
      add :ano_convenio, :date
      add :inicio_vigencia, :date
      add :fim_vigencia, :date
      add :data_assinatura, :date
      add :publicacao, :date
      add :ultimo_empenho, :date
      add :ultimo_pagamento, :date

      timestamps
    end

  end
end
