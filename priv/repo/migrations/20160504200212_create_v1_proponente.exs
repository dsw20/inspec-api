defmodule InspecApi.Repo.Migrations.CreateV1.Proponente do
  use Ecto.Migration

  def change do
    create table(:proponentes) do
      add :codigo, :string
      add :nome, :string
      add :esfera_administrativa, :string
      add :regiao, :string
      add :uf, :string
      add :municio, :string
      add :endereco, :string
      add :bairro, :string
      add :cep, :string
      add :responsavel, :string
      add :qualificacao, :string
      add :codigo_reponsavel, :integer
      add :nome_do_responsavel, :string
      add :cargo_do_responavel, :string

      timestamps
    end

  end
end
