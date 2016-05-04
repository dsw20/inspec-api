defmodule InspecApi.V1.UsuarioController do
  use InspecApi.Web, :controller

  alias InspecApi.V1.Usuario

  plug :scrub_params, "usuario" when action in [:create, :update]

  def index(conn, _params) do
    usuarios = Repo.all(Usuario)
    render(conn, "index.json", usuarios: usuarios)
  end

  def create(conn, %{"usuario" => usuario_params}) do
    changeset = Usuario.changeset(%Usuario{}, usuario_params)

    case Repo.insert(changeset) do
      {:ok, usuario} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", usuario_path(conn, :show, usuario))
        |> render("show.json", usuario: usuario)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    usuario = Repo.get!(Usuario, id)
    render(conn, "show.json", usuario: usuario)
  end

  def update(conn, %{"id" => id, "usuario" => usuario_params}) do
    usuario = Repo.get!(Usuario, id)
    changeset = Usuario.changeset(usuario, usuario_params)

    case Repo.update(changeset) do
      {:ok, usuario} ->
        render(conn, "show.json", usuario: usuario)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(InspecApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    usuario = Repo.get!(Usuario, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(usuario)

    send_resp(conn, :no_content, "")
  end
end
