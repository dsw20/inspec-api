defmodule InspecApi.V1.ProponenteTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.Proponente

  @valid_attrs %{bairro: "some content", cargo_do_responavel: "some content", cep: "some content", codigo: "some content", codigo_reponsavel: 42, endereco: "some content", esfera_administrativa: "some content", municio: "some content", nome: "some content", nome_do_responsavel: "some content", qualificacao: "some content", regiao: "some content", responsavel: "some content", uf: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Proponente.changeset(%Proponente{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Proponente.changeset(%Proponente{}, @invalid_attrs)
    refute changeset.valid?
  end
end
