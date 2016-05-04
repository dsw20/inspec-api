defmodule InspecApi.V1.UsuarioView do
  use InspecApi.Web, :view

  def render("index.json", %{usuarios: usuarios}) do
    %{data: render_many(usuarios, InspecApi.V1.UsuarioView, "usuario.json")}
  end

  def render("show.json", %{usuario: usuario}) do
    %{data: render_one(usuario, InspecApi.V1.UsuarioView, "usuario.json")}
  end

  def render("usuario.json", %{usuario: usuario}) do
    %{id: usuario.id,
      nome: usuario.nome,
      email: usuario.email,
      senha: usuario.senha,
      cpf: usuario.cpf,
      rg: usuario.rg,
      data_nascimento: usuario.data_nascimento,
      sexo: usuario.sexo}
  end
end
