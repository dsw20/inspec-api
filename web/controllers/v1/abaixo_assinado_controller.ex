defmodule InspecApi.V1.AbaixoAssinadoController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.AbaixoAssinado

  plug :scrub_params, "abaixo_assinado" when action in [:create, :update]

  def index(conn, _params) do
    abasixo_assinados = Repo.all(AbaixoAssinado)
    render(conn, "index.json", abasixo_assinados: abasixo_assinados)
  end

  def create(conn, %{"abaixo_assinado" => abaixo_assinado_params}) do
    changeset = AbaixoAssinado.changeset(%AbaixoAssinado{}, abaixo_assinado_params)

    case Repo.insert(changeset) do
      {:ok, abaixo_assinado} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", abaixo_assinado_path(conn, :show, abaixo_assinado))
        |> render("show.json", abaixo_assinado: abaixo_assinado)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    abaixo_assinado = Repo.get!(AbaixoAssinado, id)
    render(conn, "show.json", abaixo_assinado: abaixo_assinado)
  end

  def update(conn, %{"id" => id, "abaixo_assinado" => abaixo_assinado_params}) do
    abaixo_assinado = Repo.get!(AbaixoAssinado, id)
    changeset = AbaixoAssinado.changeset(abaixo_assinado, abaixo_assinado_params)

    case Repo.update(changeset) do
      {:ok, abaixo_assinado} ->
        render(conn, "show.json", abaixo_assinado: abaixo_assinado)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    abaixo_assinado = Repo.get!(AbaixoAssinado, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(abaixo_assinado)

    send_resp(conn, :no_content, "")
  end
end
