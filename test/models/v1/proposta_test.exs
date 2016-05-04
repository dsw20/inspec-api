defmodule InspecApi.V1.PropostaTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.Proposta

  @valid_attrs %{ano: 42, data_inclusao: "2010-04-17", numero: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Proposta.changeset(%Proposta{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Proposta.changeset(%Proposta{}, @invalid_attrs)
    refute changeset.valid?
  end
end
