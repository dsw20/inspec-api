defmodule InspecApi.V1.ConvenioTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.Convenio

  @valid_attrs %{codigo_acao: 42, esta_assinado: true, esta_empenhado: true, esta_publicado: true, justificativa: "some content", modalidade: "some content", numero: 42, numero_interno: 42, objeto_convenio: "some content", permite_ajuste_cronograma: true, processo_convenio: "some content", qtd_aditivos: 42, qtd_empenhos: 42, qtd_prorrogas: 42, situacao: "some content", situacao_publicacao: "some content", subsituacao: "some content", tem_aditivo: true, tem_prorrogacao_oficio: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Convenio.changeset(%Convenio{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Convenio.changeset(%Convenio{}, @invalid_attrs)
    refute changeset.valid?
  end
end
