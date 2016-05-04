defmodule InspecApi.V1.ProgramaControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.Programa
  @valid_attrs %{codigo: 42, nome: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, programa_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    programa = Repo.insert! %Programa{}
    conn = get conn, programa_path(conn, :show, programa)
    assert json_response(conn, 200)["data"] == %{"id" => programa.id,
      "codigo" => programa.codigo,
      "nome" => programa.nome}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, programa_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, programa_path(conn, :create), programa: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Programa, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, programa_path(conn, :create), programa: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    programa = Repo.insert! %Programa{}
    conn = put conn, programa_path(conn, :update, programa), programa: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Programa, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    programa = Repo.insert! %Programa{}
    conn = put conn, programa_path(conn, :update, programa), programa: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    programa = Repo.insert! %Programa{}
    conn = delete conn, programa_path(conn, :delete, programa)
    assert response(conn, 204)
    refute Repo.get(Programa, programa.id)
  end
end
