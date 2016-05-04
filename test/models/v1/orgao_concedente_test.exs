defmodule InspecApi.V1.OrgaoConcedenteTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.OrgaoConcedente

  @valid_attrs %{cargo_responsavel: "some content", cod_responsavel: 42, codigo: 42, nome: "some content", responsavel_concedente: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = OrgaoConcedente.changeset(%OrgaoConcedente{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = OrgaoConcedente.changeset(%OrgaoConcedente{}, @invalid_attrs)
    refute changeset.valid?
  end
end
