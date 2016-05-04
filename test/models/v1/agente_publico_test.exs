defmodule InspecApi.V1.AgentePublicoTest do
  use InspecApi.ModelCase

  alias InspecApi.V1.AgentePublico

  @valid_attrs %{descricao: "some content", nome: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AgentePublico.changeset(%AgentePublico{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AgentePublico.changeset(%AgentePublico{}, @invalid_attrs)
    refute changeset.valid?
  end
end
