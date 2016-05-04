defmodule InspecApi.V1.ProgramaController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.Programa

  plug :scrub_params, "programa" when action in [:create, :update]

  def index(conn, _params) do
    programas = Repo.all(Programa)
    render(conn, "index.json", programas: programas)
  end

  def create(conn, %{"programa" => programa_params}) do
    changeset = Programa.changeset(%Programa{}, programa_params)

    case Repo.insert(changeset) do
      {:ok, programa} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", programa_path(conn, :show, programa))
        |> render("show.json", programa: programa)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    programa = Repo.get!(Programa, id)
    render(conn, "show.json", programa: programa)
  end

  def update(conn, %{"id" => id, "programa" => programa_params}) do
    programa = Repo.get!(Programa, id)
    changeset = Programa.changeset(programa, programa_params)

    case Repo.update(changeset) do
      {:ok, programa} ->
        render(conn, "show.json", programa: programa)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    programa = Repo.get!(Programa, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(programa)

    send_resp(conn, :no_content, "")
  end
end
