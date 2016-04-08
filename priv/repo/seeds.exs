# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     InspecApi.Repo.insert!(%InspecApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias InspecApi.Repo
alias InspecApi.V1.User

defmodule Seeds.InspecApi do

  def import_from_csv(csv_path) do
    persist = fn([nome, email]) ->
      User.changeset(%User{}, %{"name" => nome, "email" => email})
    end

    File.read!(csv_path)
    |> ExCsv.parse!(delimiter: ';',headings: true)
    |> ExCsv.as(User)
    |> Map.get(:body)
    |> Enum.each(persist)

  end

  defp populate_user do
    [
      %User{
        name: "Eduardo",
        email: "eduardo@mail.com"
      },
      %User{
        name: "Lucas",
        email: "lucas@mail.com"
      }
    ] |> Enum.each(&Repo.insert!(&1))
  end
end

Seeds.InspecApi.import_from_csv("test.csv")
