defmodule InspecApi.V1.OrgaoConcedente do
  use InspecApi.Web, :model

  schema "orgaos_responsaveis" do
    field :codigo, :integer
    field :nome, :string
    field :responsavel_concedente, :string
    field :cod_responsavel, :integer
    field :cargo_responsavel, :string

    timestamps
  end

  @required_fields ~w(codigo nome responsavel_concedente cod_responsavel cargo_responsavel)
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
