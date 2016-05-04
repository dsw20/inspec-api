defmodule InspecApi.V1.AgentePublicoController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.AgentePublico

  plug :scrub_params, "agente_publico" when action in [:create, :update]

  def index(conn, _params) do
    agentes_publicos = Repo.all(AgentePublico)
    render(conn, "index.json", agentes_publicos: agentes_publicos)
  end

  def create(conn, %{"agente_publico" => agente_publico_params}) do
    changeset = AgentePublico.changeset(%AgentePublico{}, agente_publico_params)

    case Repo.insert(changeset) do
      {:ok, agente_publico} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", agente_publico_path(conn, :show, agente_publico))
        |> render("show.json", agente_publico: agente_publico)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    agente_publico = Repo.get!(AgentePublico, id)
    render(conn, "show.json", agente_publico: agente_publico)
  end

  def update(conn, %{"id" => id, "agente_publico" => agente_publico_params}) do
    agente_publico = Repo.get!(AgentePublico, id)
    changeset = AgentePublico.changeset(agente_publico, agente_publico_params)

    case Repo.update(changeset) do
      {:ok, agente_publico} ->
        render(conn, "show.json", agente_publico: agente_publico)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    agente_publico = Repo.get!(AgentePublico, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(agente_publico)

    send_resp(conn, :no_content, "")
  end
end
