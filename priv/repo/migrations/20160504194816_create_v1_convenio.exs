defmodule InspecApi.Repo.Migrations.CreateV1.Convenio do
  use Ecto.Migration

  def change do
    create table(:convenios) do
      add :numero, :integer
      add :modalidade, :string
      add :situacao, :string
      add :subsituacao, :string
      add :objeto_convenio, :text
      add :justificativa, :text
      add :processo_convenio, :string
      add :numero_interno, :integer
      add :esta_assinado, :boolean, default: false
      add :tem_aditivo, :boolean, default: false
      add :esta_publicado, :boolean, default: false
      add :esta_empenhado, :boolean, default: false
      add :tem_prorrogacao_oficio, :boolean, default: false
      add :permite_ajuste_cronograma, :boolean, default: false
      add :qtd_empenhos, :integer
      add :qtd_aditivos, :integer
      add :qtd_prorrogas, :integer
      add :codigo_acao, :integer
      add :situacao_publicacao, :string

      timestamps
    end

  end
end
