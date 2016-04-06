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

