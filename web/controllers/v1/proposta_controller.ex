defmodule InspecApi.V1.PropostaController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.Proposta

  plug :scrub_params, "proposta" when action in [:create, :update]

  def index(conn, _params) do
    propostas = Repo.all(Proposta)
    render(conn, "index.json", propostas: propostas)
  end

  def create(conn, %{"proposta" => proposta_params}) do
    changeset = Proposta.changeset(%Proposta{}, proposta_params)

    case Repo.insert(changeset) do
      {:ok, proposta} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", proposta_path(conn, :show, proposta))
        |> render("show.json", proposta: proposta)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    proposta = Repo.get!(Proposta, id)
    render(conn, "show.json", proposta: proposta)
  end

  def update(conn, %{"id" => id, "proposta" => proposta_params}) do
    proposta = Repo.get!(Proposta, id)
    changeset = Proposta.changeset(proposta, proposta_params)

    case Repo.update(changeset) do
      {:ok, proposta} ->
        render(conn, "show.json", proposta: proposta)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    proposta = Repo.get!(Proposta, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(proposta)

    send_resp(conn, :no_content, "")
  end
end
