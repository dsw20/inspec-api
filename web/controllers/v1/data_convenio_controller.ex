defmodule InspecApi.V1.DataConvenioController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.DataConvenio

  plug :scrub_params, "data_convenio" when action in [:create, :update]

  def index(conn, _params) do
    datas_convenio = Repo.all(DataConvenio)
    render(conn, "index.json", datas_convenio: datas_convenio)
  end

  def create(conn, %{"data_convenio" => data_convenio_params}) do
    changeset = DataConvenio.changeset(%DataConvenio{}, data_convenio_params)

    case Repo.insert(changeset) do
      {:ok, data_convenio} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", data_convenio_path(conn, :show, data_convenio))
        |> render("show.json", data_convenio: data_convenio)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    data_convenio = Repo.get!(DataConvenio, id)
    render(conn, "show.json", data_convenio: data_convenio)
  end

  def update(conn, %{"id" => id, "data_convenio" => data_convenio_params}) do
    data_convenio = Repo.get!(DataConvenio, id)
    changeset = DataConvenio.changeset(data_convenio, data_convenio_params)

    case Repo.update(changeset) do
      {:ok, data_convenio} ->
        render(conn, "show.json", data_convenio: data_convenio)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    data_convenio = Repo.get!(DataConvenio, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(data_convenio)

    send_resp(conn, :no_content, "")
  end
end
