defmodule InspecApi.V1.DataConvenioTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.DataConvenio

  @valid_attrs %{ano_convenio: "2010-04-17", data_assinatura: "2010-04-17", fim_vigencia: "2010-04-17", inicio_vigencia: "2010-04-17", publicacao: "2010-04-17", ultimo_empenho: "2010-04-17", ultimo_pagamento: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DataConvenio.changeset(%DataConvenio{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DataConvenio.changeset(%DataConvenio{}, @invalid_attrs)
    refute changeset.valid?
  end
end
