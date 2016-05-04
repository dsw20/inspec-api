defmodule InspecApi.Repo.Migrations.CreateV1.Usuario do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nome, :string
      add :email, :string
      add :senha, :string
      add :cpf, :string
      add :rg, :string
      add :data_nascimento, :string
      add :sexo, :string

      timestamps
    end

  end
end
