defmodule InspecApi.V1.UsuarioControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.Usuario
  @valid_attrs %{cpf: "some content", data_nascimento: "some content", email: "some content", nome: "some content", rg: "some content", senha: "some content", sexo: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, usuario_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    usuario = Repo.insert! %Usuario{}
    conn = get conn, usuario_path(conn, :show, usuario)
    assert json_response(conn, 200)["data"] == %{"id" => usuario.id,
      "nome" => usuario.nome,
      "email" => usuario.email,
      "senha" => usuario.senha,
      "cpf" => usuario.cpf,
      "rg" => usuario.rg,
      "data_nascimento" => usuario.data_nascimento,
      "sexo" => usuario.sexo}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, usuario_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, usuario_path(conn, :create), usuario: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Usuario, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, usuario_path(conn, :create), usuario: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    usuario = Repo.insert! %Usuario{}
    conn = put conn, usuario_path(conn, :update, usuario), usuario: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Usuario, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    usuario = Repo.insert! %Usuario{}
    conn = put conn, usuario_path(conn, :update, usuario), usuario: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    usuario = Repo.insert! %Usuario{}
    conn = delete conn, usuario_path(conn, :delete, usuario)
    assert response(conn, 204)
    refute Repo.get(Usuario, usuario.id)
  end
end
