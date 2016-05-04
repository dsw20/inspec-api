defmodule InspecApi.V1.OrgaoSuperiorTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.OrgaoSuperior

  @valid_attrs %{nome: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = OrgaoSuperior.changeset(%OrgaoSuperior{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = OrgaoSuperior.changeset(%OrgaoSuperior{}, @invalid_attrs)
    refute changeset.valid?
  end
end
