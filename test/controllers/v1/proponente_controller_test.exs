defmodule InspecApi.V1.ProponenteControllerTest do
  use InspecApi.ConnCase

  alias InspecApi.V1.Proponente
  @valid_attrs %{bairro: "some content", cargo_do_responavel: "some content", cep: "some content", codigo: "some content", codigo_reponsavel: 42, endereco: "some content", esfera_administrativa: "some content", municio: "some content", nome: "some content", nome_do_responsavel: "some content", qualificacao: "some content", regiao: "some content", responsavel: "some content", uf: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, proponente_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    proponente = Repo.insert! %Proponente{}
    conn = get conn, proponente_path(conn, :show, proponente)
    assert json_response(conn, 200)["data"] == %{"id" => proponente.id,
      "codigo" => proponente.codigo,
      "nome" => proponente.nome,
      "esfera_administrativa" => proponente.esfera_administrativa,
      "regiao" => proponente.regiao,
      "uf" => proponente.uf,
      "municio" => proponente.municio,
      "endereco" => proponente.endereco,
      "bairro" => proponente.bairro,
      "cep" => proponente.cep,
      "responsavel" => proponente.responsavel,
      "qualificacao" => proponente.qualificacao,
      "codigo_reponsavel" => proponente.codigo_reponsavel,
      "nome_do_responsavel" => proponente.nome_do_responsavel,
      "cargo_do_responavel" => proponente.cargo_do_responavel}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, proponente_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, proponente_path(conn, :create), proponente: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Proponente, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, proponente_path(conn, :create), proponente: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    proponente = Repo.insert! %Proponente{}
    conn = put conn, proponente_path(conn, :update, proponente), proponente: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Proponente, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    proponente = Repo.insert! %Proponente{}
    conn = put conn, proponente_path(conn, :update, proponente), proponente: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    proponente = Repo.insert! %Proponente{}
    conn = delete conn, proponente_path(conn, :delete, proponente)
    assert response(conn, 204)
    refute Repo.get(Proponente, proponente.id)
  end
end
