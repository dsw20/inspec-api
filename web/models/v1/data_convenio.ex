defmodule InspecApi.V1.DataConvenio do
  use InspecApi.Web, :model

  schema "datas_convenio" do
    field :ano_convenio, Ecto.Date
    field :inicio_vigencia, Ecto.Date
    field :fim_vigencia, Ecto.Date
    field :data_assinatura, Ecto.Date
    field :publicacao, Ecto.Date
    field :ultimo_empenho, Ecto.Date
    field :ultimo_pagamento, Ecto.Date

    timestamps
  end

  @required_fields ~w(ano_convenio inicio_vigencia fim_vigencia data_assinatura publicacao ultimo_empenho ultimo_pagamento)
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
