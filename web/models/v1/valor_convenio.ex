defmodule InspecApi.V1.ValorConvenio do
  use InspecApi.Web, :model

  schema "valores_convenio" do
    field :valor_global, :float
    field :repasse_uniao, :float
    field :contrapartida_total, :float
    field :contrapartida_bens_servicos, :float
    field :valor_desenbolcado, :float
    field :valor_empenhado, :float

    timestamps
  end

  @required_fields ~w(valor_global repasse_uniao contrapartida_total contrapartida_bens_servicos valor_desenbolcado valor_empenhado)
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
