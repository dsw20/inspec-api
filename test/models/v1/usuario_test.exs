defmodule InspecApi.V1.UsuarioTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.Usuario

  @valid_attrs %{cpf: "some content", data_nascimento: "some content", email: "some content", nome: "some content", rg: "some content", senha: "some content", sexo: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Usuario.changeset(%Usuario{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Usuario.changeset(%Usuario{}, @invalid_attrs)
    refute changeset.valid?
  end
end
