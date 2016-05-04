defmodule InspecApi.V1.ConvenioController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.Convenio

  plug :scrub_params, "convenio" when action in [:create, :update]

  def index(conn, _params) do
    convenios = Repo.all(Convenio)
    render(conn, "index.json", convenios: convenios)
  end

  def create(conn, %{"convenio" => convenio_params}) do
    changeset = Convenio.changeset(%Convenio{}, convenio_params)

    case Repo.insert(changeset) do
      {:ok, convenio} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", convenio_path(conn, :show, convenio))
        |> render("show.json", convenio: convenio)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    convenio = Repo.get!(Convenio, id)
    render(conn, "show.json", convenio: convenio)
  end

  def update(conn, %{"id" => id, "convenio" => convenio_params}) do
    convenio = Repo.get!(Convenio, id)
    changeset = Convenio.changeset(convenio, convenio_params)

    case Repo.update(changeset) do
      {:ok, convenio} ->
        render(conn, "show.json", convenio: convenio)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    convenio = Repo.get!(Convenio, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(convenio)

    send_resp(conn, :no_content, "")
  end
end
