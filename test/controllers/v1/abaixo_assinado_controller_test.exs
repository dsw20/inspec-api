defmodule InspecApi.V1.AbaixoAssinadoControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.AbaixoAssinado
  @valid_attrs %{descricao: "some content", nome: "some content", status: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, abaixo_assinado_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    abaixo_assinado = Repo.insert! %AbaixoAssinado{}
    conn = get conn, abaixo_assinado_path(conn, :show, abaixo_assinado)
    assert json_response(conn, 200)["data"] == %{"id" => abaixo_assinado.id,
      "nome" => abaixo_assinado.nome,
      "descricao" => abaixo_assinado.descricao,
      "status" => abaixo_assinado.status}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, abaixo_assinado_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, abaixo_assinado_path(conn, :create), abaixo_assinado: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(AbaixoAssinado, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, abaixo_assinado_path(conn, :create), abaixo_assinado: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    abaixo_assinado = Repo.insert! %AbaixoAssinado{}
    conn = put conn, abaixo_assinado_path(conn, :update, abaixo_assinado), abaixo_assinado: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(AbaixoAssinado, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    abaixo_assinado = Repo.insert! %AbaixoAssinado{}
    conn = put conn, abaixo_assinado_path(conn, :update, abaixo_assinado), abaixo_assinado: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    abaixo_assinado = Repo.insert! %AbaixoAssinado{}
    conn = delete conn, abaixo_assinado_path(conn, :delete, abaixo_assinado)
    assert response(conn, 204)
    refute Repo.get(AbaixoAssinado, abaixo_assinado.id)
  end
end
