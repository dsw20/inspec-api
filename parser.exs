alias InspecApi.Repo
alias InspecApi.V1.User

defmodule Seed.CSV do
  def import_from_csv(csv_path) do
    persist = fn([nome, email]) ->
      User.changeset(%User{}, %{"name" => nome, "email" => email})
    end
IO.puts(1)
    File.read!(csv_path)
    |> ExCsv.parse!(delimiter: ';',headings: true)
    |> ExCsv.as(User)
    |> Map.get(:body)
    |> Enum.each(fn(x) -> IO.puts(x) end)
    #    |> Enum.each(persist)

  end
end

Seed.CSV.import_from_csv("test.csv")

