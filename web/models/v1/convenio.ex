defmodule InspecApi.V1.Convenio do
  use InspecApi.Web, :model

  schema "convenios" do
    field :numero, :integer
    field :modalidade, :string
    field :situacao, :string
    field :subsituacao, :string
    field :objeto_convenio, :string
    field :justificativa, :string
    field :processo_convenio, :string
    field :numero_interno, :integer
    field :esta_assinado, :boolean, default: false
    field :tem_aditivo, :boolean, default: false
    field :esta_publicado, :boolean, default: false
    field :esta_empenhado, :boolean, default: false
    field :tem_prorrogacao_oficio, :boolean, default: false
    field :permite_ajuste_cronograma, :boolean, default: false
    field :qtd_empenhos, :integer
    field :qtd_aditivos, :integer
    field :qtd_prorrogas, :integer
    field :codigo_acao, :integer
    field :situacao_publicacao, :string

    timestamps
  end

  @required_fields ~w(numero modalidade situacao subsituacao objeto_convenio justificativa processo_convenio numero_interno esta_assinado tem_aditivo esta_publicado esta_empenhado tem_prorrogacao_oficio permite_ajuste_cronograma qtd_empenhos qtd_aditivos qtd_prorrogas codigo_acao situacao_publicacao)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
