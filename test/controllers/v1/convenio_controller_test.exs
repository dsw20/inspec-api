defmodule InspecApi.V1.ConvenioControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.Convenio
  @valid_attrs %{codigo_acao: 42, esta_assinado: true, esta_empenhado: true, esta_publicado: true, justificativa: "some content", modalidade: "some content", numero: 42, numero_interno: 42, objeto_convenio: "some content", permite_ajuste_cronograma: true, processo_convenio: "some content", qtd_aditivos: 42, qtd_empenhos: 42, qtd_prorrogas: 42, situacao: "some content", situacao_publicacao: "some content", subsituacao: "some content", tem_aditivo: true, tem_prorrogacao_oficio: true}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, convenio_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    convenio = Repo.insert! %Convenio{}
    conn = get conn, convenio_path(conn, :show, convenio)
    assert json_response(conn, 200)["data"] == %{"id" => convenio.id,
      "numero" => convenio.numero,
      "modalidade" => convenio.modalidade,
      "situacao" => convenio.situacao,
      "subsituacao" => convenio.subsituacao,
      "objeto_convenio" => convenio.objeto_convenio,
      "justificativa" => convenio.justificativa,
      "processo_convenio" => convenio.processo_convenio,
      "numero_interno" => convenio.numero_interno,
      "esta_assinado" => convenio.esta_assinado,
      "tem_aditivo" => convenio.tem_aditivo,
      "esta_publicado" => convenio.esta_publicado,
      "esta_empenhado" => convenio.esta_empenhado,
      "tem_prorrogacao_oficio" => convenio.tem_prorrogacao_oficio,
      "permite_ajuste_cronograma" => convenio.permite_ajuste_cronograma,
      "qtd_empenhos" => convenio.qtd_empenhos,
      "qtd_aditivos" => convenio.qtd_aditivos,
      "qtd_prorrogas" => convenio.qtd_prorrogas,
      "codigo_acao" => convenio.codigo_acao,
      "situacao_publicacao" => convenio.situacao_publicacao}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, convenio_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, convenio_path(conn, :create), convenio: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Convenio, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, convenio_path(conn, :create), convenio: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    convenio = Repo.insert! %Convenio{}
    conn = put conn, convenio_path(conn, :update, convenio), convenio: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Convenio, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    convenio = Repo.insert! %Convenio{}
    conn = put conn, convenio_path(conn, :update, convenio), convenio: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    convenio = Repo.insert! %Convenio{}
    conn = delete conn, convenio_path(conn, :delete, convenio)
    assert response(conn, 204)
    refute Repo.get(Convenio, convenio.id)
  end
end
