defmodule InspecApi.V1.ValorConvenioControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.ValorConvenio
  @valid_attrs %{contrapartida_bens_servicos: "120.5", contrapartida_total: "120.5", repasse_uniao: "120.5", valor_desenbolcado: "120.5", valor_empenhado: "120.5", valor_global: "120.5"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, valor_convenio_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    valor_convenio = Repo.insert! %ValorConvenio{}
    conn = get conn, valor_convenio_path(conn, :show, valor_convenio)
    assert json_response(conn, 200)["data"] == %{"id" => valor_convenio.id,
      "valor_global" => valor_convenio.valor_global,
      "repasse_uniao" => valor_convenio.repasse_uniao,
      "contrapartida_total" => valor_convenio.contrapartida_total,
      "contrapartida_total" => valor_convenio.contrapartida_total,
      "contrapartida_bens_servicos" => valor_convenio.contrapartida_bens_servicos,
      "valor_desenbolcado" => valor_convenio.valor_desenbolcado,
      "valor_empenhado" => valor_convenio.valor_empenhado}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, valor_convenio_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, valor_convenio_path(conn, :create), valor_convenio: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ValorConvenio, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, valor_convenio_path(conn, :create), valor_convenio: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    valor_convenio = Repo.insert! %ValorConvenio{}
    conn = put conn, valor_convenio_path(conn, :update, valor_convenio), valor_convenio: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ValorConvenio, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    valor_convenio = Repo.insert! %ValorConvenio{}
    conn = put conn, valor_convenio_path(conn, :update, valor_convenio), valor_convenio: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    valor_convenio = Repo.insert! %ValorConvenio{}
    conn = delete conn, valor_convenio_path(conn, :delete, valor_convenio)
    assert response(conn, 204)
    refute Repo.get(ValorConvenio, valor_convenio.id)
  end
end
