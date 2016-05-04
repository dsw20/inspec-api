defmodule InspecApi.V1.RelatorioController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.Relatorio

  plug :scrub_params, "relatorio" when action in [:create, :update]

  def index(conn, _params) do
    relatorios = Repo.all(Relatorio)
    render(conn, "index.json", relatorios: relatorios)
  end

  def create(conn, %{"relatorio" => relatorio_params}) do
    changeset = Relatorio.changeset(%Relatorio{}, relatorio_params)

    case Repo.insert(changeset) do
      {:ok, relatorio} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", relatorio_path(conn, :show, relatorio))
        |> render("show.json", relatorio: relatorio)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    relatorio = Repo.get!(Relatorio, id)
    render(conn, "show.json", relatorio: relatorio)
  end

  def update(conn, %{"id" => id, "relatorio" => relatorio_params}) do
    relatorio = Repo.get!(Relatorio, id)
    changeset = Relatorio.changeset(relatorio, relatorio_params)

    case Repo.update(changeset) do
      {:ok, relatorio} ->
        render(conn, "show.json", relatorio: relatorio)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    relatorio = Repo.get!(Relatorio, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(relatorio)

    send_resp(conn, :no_content, "")
  end
end
