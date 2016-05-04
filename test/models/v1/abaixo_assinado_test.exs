defmodule InspecApi.V1.AbaixoAssinadoTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.AbaixoAssinado

  @valid_attrs %{descricao: "some content", nome: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AbaixoAssinado.changeset(%AbaixoAssinado{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AbaixoAssinado.changeset(%AbaixoAssinado{}, @invalid_attrs)
    refute changeset.valid?
  end
end
