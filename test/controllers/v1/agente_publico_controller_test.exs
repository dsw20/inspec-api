defmodule InspecApi.V1.AgentePublicoControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.AgentePublico
  @valid_attrs %{descricao: "some content", nome: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, agente_publico_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    agente_publico = Repo.insert! %AgentePublico{}
    conn = get conn, agente_publico_path(conn, :show, agente_publico)
    assert json_response(conn, 200)["data"] == %{"id" => agente_publico.id,
      "nome" => agente_publico.nome,
      "descricao" => agente_publico.descricao}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, agente_publico_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, agente_publico_path(conn, :create), agente_publico: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(AgentePublico, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, agente_publico_path(conn, :create), agente_publico: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    agente_publico = Repo.insert! %AgentePublico{}
    conn = put conn, agente_publico_path(conn, :update, agente_publico), agente_publico: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(AgentePublico, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    agente_publico = Repo.insert! %AgentePublico{}
    conn = put conn, agente_publico_path(conn, :update, agente_publico), agente_publico: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    agente_publico = Repo.insert! %AgentePublico{}
    conn = delete conn, agente_publico_path(conn, :delete, agente_publico)
    assert response(conn, 204)
    refute Repo.get(AgentePublico, agente_publico.id)
  end
end
