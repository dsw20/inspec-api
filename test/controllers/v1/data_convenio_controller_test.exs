defmodule InspecApi.V1.DataConvenioControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.DataConvenio
  @valid_attrs %{ano_convenio: "2010-04-17", data_assinatura: "2010-04-17", fim_vigencia: "2010-04-17", inicio_vigencia: "2010-04-17", publicacao: "2010-04-17", ultimo_empenho: "2010-04-17", ultimo_pagamento: "2010-04-17"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, data_convenio_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    data_convenio = Repo.insert! %DataConvenio{}
    conn = get conn, data_convenio_path(conn, :show, data_convenio)
    assert json_response(conn, 200)["data"] == %{"id" => data_convenio.id,
      "ano_convenio" => data_convenio.ano_convenio,
      "inicio_vigencia" => data_convenio.inicio_vigencia,
      "fim_vigencia" => data_convenio.fim_vigencia,
      "data_assinatura" => data_convenio.data_assinatura,
      "publicacao" => data_convenio.publicacao,
      "ultimo_empenho" => data_convenio.ultimo_empenho,
      "ultimo_pagamento" => data_convenio.ultimo_pagamento}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, data_convenio_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, data_convenio_path(conn, :create), data_convenio: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(DataConvenio, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, data_convenio_path(conn, :create), data_convenio: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    data_convenio = Repo.insert! %DataConvenio{}
    conn = put conn, data_convenio_path(conn, :update, data_convenio), data_convenio: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(DataConvenio, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    data_convenio = Repo.insert! %DataConvenio{}
    conn = put conn, data_convenio_path(conn, :update, data_convenio), data_convenio: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    data_convenio = Repo.insert! %DataConvenio{}
    conn = delete conn, data_convenio_path(conn, :delete, data_convenio)
    assert response(conn, 204)
    refute Repo.get(DataConvenio, data_convenio.id)
  end
end
