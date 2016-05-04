defmodule InspecApi.V1.Usuario do
  use InspecApi.Web, :model

  schema "usuarios" do
    field :nome, :string
    field :email, :string
    field :senha, :string
    field :cpf, :string
    field :rg, :string
    field :data_nascimento, :string
    field :sexo, :string

    timestamps
  end

  @required_fields ~w(nome email senha cpf rg data_nascimento sexo)
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
