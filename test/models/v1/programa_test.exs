defmodule InspecApi.V1.ProgramaTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.Programa

  @valid_attrs %{codigo: 42, nome: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Programa.changeset(%Programa{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Programa.changeset(%Programa{}, @invalid_attrs)
    refute changeset.valid?
  end
end
