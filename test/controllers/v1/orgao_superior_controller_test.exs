defmodule InspecApi.V1.OrgaoSuperiorControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.OrgaoSuperior
  @valid_attrs %{nome: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, orgao_superior_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    orgao_superior = Repo.insert! %OrgaoSuperior{}
    conn = get conn, orgao_superior_path(conn, :show, orgao_superior)
    assert json_response(conn, 200)["data"] == %{"id" => orgao_superior.id,
      "nome" => orgao_superior.nome}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, orgao_superior_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, orgao_superior_path(conn, :create), orgao_superior: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(OrgaoSuperior, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, orgao_superior_path(conn, :create), orgao_superior: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    orgao_superior = Repo.insert! %OrgaoSuperior{}
    conn = put conn, orgao_superior_path(conn, :update, orgao_superior), orgao_superior: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(OrgaoSuperior, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    orgao_superior = Repo.insert! %OrgaoSuperior{}
    conn = put conn, orgao_superior_path(conn, :update, orgao_superior), orgao_superior: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    orgao_superior = Repo.insert! %OrgaoSuperior{}
    conn = delete conn, orgao_superior_path(conn, :delete, orgao_superior)
    assert response(conn, 204)
    refute Repo.get(OrgaoSuperior, orgao_superior.id)
  end
end
