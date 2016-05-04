defmodule InspecApi.V1.PropostaControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.Proposta
  @valid_attrs %{ano: 42, data_inclusao: "2010-04-17", numero: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, proposta_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    proposta = Repo.insert! %Proposta{}
    conn = get conn, proposta_path(conn, :show, proposta)
    assert json_response(conn, 200)["data"] == %{"id" => proposta.id,
      "numero" => proposta.numero,
      "ano" => proposta.ano,
      "data_inclusao" => proposta.data_inclusao}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, proposta_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, proposta_path(conn, :create), proposta: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Proposta, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, proposta_path(conn, :create), proposta: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    proposta = Repo.insert! %Proposta{}
    conn = put conn, proposta_path(conn, :update, proposta), proposta: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Proposta, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    proposta = Repo.insert! %Proposta{}
    conn = put conn, proposta_path(conn, :update, proposta), proposta: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    proposta = Repo.insert! %Proposta{}
    conn = delete conn, proposta_path(conn, :delete, proposta)
    assert response(conn, 204)
    refute Repo.get(Proposta, proposta.id)
  end
end
