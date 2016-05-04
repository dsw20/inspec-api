defmodule InspecApi.V1.ValorConvenioTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.ValorConvenio

  @valid_attrs %{contrapartida_bens_servicos: "120.5", contrapartida_total: "120.5", repasse_uniao: "120.5", valor_desenbolcado: "120.5", valor_empenhado: "120.5", valor_global: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ValorConvenio.changeset(%ValorConvenio{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ValorConvenio.changeset(%ValorConvenio{}, @invalid_attrs)
    refute changeset.valid?
  end
end
