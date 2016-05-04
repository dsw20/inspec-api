defmodule InspecApi.V1.Relatorio do
  use InspecApi.Web, :model

  schema "relatorios" do
    field :titulo, :string
    field :conteudo, :string

    timestamps
  end

  @required_fields ~w(titulo conteudo)
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
