defmodule InspecApi.V1.AgentePublico do
  use InspecApi.Web, :model

  schema "agentes_publicos" do
    field :nome, :string
    field :descricao, :string

    timestamps
  end

  @required_fields ~w(nome descricao)
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
