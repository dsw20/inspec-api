defmodule InspecApi.V1.ProponenteController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.Proponente

  plug :scrub_params, "proponente" when action in [:create, :update]

  def index(conn, _params) do
    proponentes = Repo.all(Proponente)
    render(conn, "index.json", proponentes: proponentes)
  end

  def create(conn, %{"proponente" => proponente_params}) do
    changeset = Proponente.changeset(%Proponente{}, proponente_params)

    case Repo.insert(changeset) do
      {:ok, proponente} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", proponente_path(conn, :show, proponente))
        |> render("show.json", proponente: proponente)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    proponente = Repo.get!(Proponente, id)
    render(conn, "show.json", proponente: proponente)
  end

  def update(conn, %{"id" => id, "proponente" => proponente_params}) do
    proponente = Repo.get!(Proponente, id)
    changeset = Proponente.changeset(proponente, proponente_params)

    case Repo.update(changeset) do
      {:ok, proponente} ->
        render(conn, "show.json", proponente: proponente)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    proponente = Repo.get!(Proponente, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(proponente)

    send_resp(conn, :no_content, "")
  end
end
