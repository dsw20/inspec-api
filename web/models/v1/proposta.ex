defmodule InspecApi.V1.Proposta do
  use InspecApi.Web, :model

  schema "propostas" do
    field :numero, :integer
    field :ano, :integer
    field :data_inclusao, Ecto.Date

    timestamps
  end

  @required_fields ~w(numero ano data_inclusao)
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
