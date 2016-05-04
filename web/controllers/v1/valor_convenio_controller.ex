defmodule InspecApi.V1.ValorConvenioController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.ValorConvenio

  plug :scrub_params, "valor_convenio" when action in [:create, :update]

  def index(conn, _params) do
    valores_convenio = Repo.all(ValorConvenio)
    render(conn, "index.json", valores_convenio: valores_convenio)
  end

  def create(conn, %{"valor_convenio" => valor_convenio_params}) do
    changeset = ValorConvenio.changeset(%ValorConvenio{}, valor_convenio_params)

    case Repo.insert(changeset) do
      {:ok, valor_convenio} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", valor_convenio_path(conn, :show, valor_convenio))
        |> render("show.json", valor_convenio: valor_convenio)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    valor_convenio = Repo.get!(ValorConvenio, id)
    render(conn, "show.json", valor_convenio: valor_convenio)
  end

  def update(conn, %{"id" => id, "valor_convenio" => valor_convenio_params}) do
    valor_convenio = Repo.get!(ValorConvenio, id)
    changeset = ValorConvenio.changeset(valor_convenio, valor_convenio_params)

    case Repo.update(changeset) do
      {:ok, valor_convenio} ->
        render(conn, "show.json", valor_convenio: valor_convenio)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    valor_convenio = Repo.get!(ValorConvenio, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(valor_convenio)

    send_resp(conn, :no_content, "")
  end
end
