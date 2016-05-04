defmodule InspecApi.V1.OrgaoConcedenteController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.OrgaoConcedente

  plug :scrub_params, "orgao_concedente" when action in [:create, :update]

  def index(conn, _params) do
    orgaos_responsaveis = Repo.all(OrgaoConcedente)
    render(conn, "index.json", orgaos_responsaveis: orgaos_responsaveis)
  end

  def create(conn, %{"orgao_concedente" => orgao_concedente_params}) do
    changeset = OrgaoConcedente.changeset(%OrgaoConcedente{}, orgao_concedente_params)

    case Repo.insert(changeset) do
      {:ok, orgao_concedente} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", orgao_concedente_path(conn, :show, orgao_concedente))
        |> render("show.json", orgao_concedente: orgao_concedente)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    orgao_concedente = Repo.get!(OrgaoConcedente, id)
    render(conn, "show.json", orgao_concedente: orgao_concedente)
  end

  def update(conn, %{"id" => id, "orgao_concedente" => orgao_concedente_params}) do
    orgao_concedente = Repo.get!(OrgaoConcedente, id)
    changeset = OrgaoConcedente.changeset(orgao_concedente, orgao_concedente_params)

    case Repo.update(changeset) do
      {:ok, orgao_concedente} ->
        render(conn, "show.json", orgao_concedente: orgao_concedente)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    orgao_concedente = Repo.get!(OrgaoConcedente, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(orgao_concedente)

    send_resp(conn, :no_content, "")
  end
end
