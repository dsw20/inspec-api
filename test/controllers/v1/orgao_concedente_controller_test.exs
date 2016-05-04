defmodule InspecApi.V1.OrgaoConcedenteControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.OrgaoConcedente
  @valid_attrs %{cargo_responsavel: "some content", cod_responsavel: 42, codigo: 42, nome: "some content", responsavel_concedente: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, orgao_concedente_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    orgao_concedente = Repo.insert! %OrgaoConcedente{}
    conn = get conn, orgao_concedente_path(conn, :show, orgao_concedente)
    assert json_response(conn, 200)["data"] == %{"id" => orgao_concedente.id,
      "codigo" => orgao_concedente.codigo,
      "nome" => orgao_concedente.nome,
      "responsavel_concedente" => orgao_concedente.responsavel_concedente,
      "cod_responsavel" => orgao_concedente.cod_responsavel,
      "cargo_responsavel" => orgao_concedente.cargo_responsavel}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, orgao_concedente_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, orgao_concedente_path(conn, :create), orgao_concedente: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(OrgaoConcedente, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, orgao_concedente_path(conn, :create), orgao_concedente: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    orgao_concedente = Repo.insert! %OrgaoConcedente{}
    conn = put conn, orgao_concedente_path(conn, :update, orgao_concedente), orgao_concedente: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(OrgaoConcedente, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    orgao_concedente = Repo.insert! %OrgaoConcedente{}
    conn = put conn, orgao_concedente_path(conn, :update, orgao_concedente), orgao_concedente: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    orgao_concedente = Repo.insert! %OrgaoConcedente{}
    conn = delete conn, orgao_concedente_path(conn, :delete, orgao_concedente)
    assert response(conn, 204)
    refute Repo.get(OrgaoConcedente, orgao_concedente.id)
  end
end
