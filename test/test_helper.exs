ExUnit.start

Mix.Task.run "ecto.create", ~w(-r InspecApi.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r InspecApi.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(InspecApi.Repo)

