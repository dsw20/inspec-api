defmodule InspecApi.V1.Programa do
  use InspecApi.Web, :model

  schema "programas" do
    field :codigo, :integer
    field :nome, :string

    timestamps
  end

  @required_fields ~w(codigo nome)
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
