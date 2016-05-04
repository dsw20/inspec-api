defmodule InspecApi.V1.RelatorioControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.Relatorio
  @valid_attrs %{conteudo: "some content", titulo: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, relatorio_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    relatorio = Repo.insert! %Relatorio{}
    conn = get conn, relatorio_path(conn, :show, relatorio)
    assert json_response(conn, 200)["data"] == %{"id" => relatorio.id,
      "titulo" => relatorio.titulo,
      "conteudo" => relatorio.conteudo}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, relatorio_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, relatorio_path(conn, :create), relatorio: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Relatorio, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, relatorio_path(conn, :create), relatorio: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    relatorio = Repo.insert! %Relatorio{}
    conn = put conn, relatorio_path(conn, :update, relatorio), relatorio: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Relatorio, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    relatorio = Repo.insert! %Relatorio{}
    conn = put conn, relatorio_path(conn, :update, relatorio), relatorio: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    relatorio = Repo.insert! %Relatorio{}
    conn = delete conn, relatorio_path(conn, :delete, relatorio)
    assert response(conn, 204)
    refute Repo.get(Relatorio, relatorio.id)
  end
end
