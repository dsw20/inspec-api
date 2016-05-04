defmodule InspecApi.V1.OrgaoSuperiorController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.OrgaoSuperior

  plug :scrub_params, "orgao_superior" when action in [:create, :update]

  def index(conn, _params) do
    orgaos_superiores = Repo.all(OrgaoSuperior)
    render(conn, "index.json", orgaos_superiores: orgaos_superiores)
  end

  def create(conn, %{"orgao_superior" => orgao_superior_params}) do
    changeset = OrgaoSuperior.changeset(%OrgaoSuperior{}, orgao_superior_params)

    case Repo.insert(changeset) do
      {:ok, orgao_superior} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", orgao_superior_path(conn, :show, orgao_superior))
        |> render("show.json", orgao_superior: orgao_superior)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    orgao_superior = Repo.get!(OrgaoSuperior, id)
    render(conn, "show.json", orgao_superior: orgao_superior)
  end

  def update(conn, %{"id" => id, "orgao_superior" => orgao_superior_params}) do
    orgao_superior = Repo.get!(OrgaoSuperior, id)
    changeset = OrgaoSuperior.changeset(orgao_superior, orgao_superior_params)

    case Repo.update(changeset) do
      {:ok, orgao_superior} ->
        render(conn, "show.json", orgao_superior: orgao_superior)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    orgao_superior = Repo.get!(OrgaoSuperior, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(orgao_superior)

    send_resp(conn, :no_content, "")
  end
end
