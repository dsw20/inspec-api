defmodule InspecApi.V1.Proponente do
  use InspecApi.Web, :model

  schema "proponentes" do
    field :codigo, :string
    field :nome, :string
    field :esfera_administrativa, :string
    field :regiao, :string
    field :uf, :string
    field :municio, :string
    field :endereco, :string
    field :bairro, :string
    field :cep, :string
    field :responsavel, :string
    field :qualificacao, :string
    field :codigo_reponsavel, :integer
    field :nome_do_responsavel, :string
    field :cargo_do_responavel, :string

    timestamps
  end

  @required_fields ~w(codigo nome esfera_administrativa regiao uf municio endereco bairro cep responsavel qualificacao codigo_reponsavel nome_do_responsavel cargo_do_responavel)
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
