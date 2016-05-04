defmodule InspecApi.V1.RelatorioTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.Relatorio

  @valid_attrs %{conteudo: "some content", titulo: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Relatorio.changeset(%Relatorio{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Relatorio.changeset(%Relatorio{}, @invalid_attrs)
    refute changeset.valid?
  end
end
