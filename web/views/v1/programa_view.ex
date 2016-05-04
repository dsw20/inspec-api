defmodule InspecApi.V1.ProgramaView do
  use InspecApi.Web, :view

  def render("index.json", %{programas: programas}) do
    %{data: render_many(programas, InspecApi.V1.ProgramaView, "programa.json")}
  end

  def render("show.json", %{programa: programa}) do
    %{data: render_one(programa, InspecApi.V1.ProgramaView, "programa.json")}
  end

  def render("programa.json", %{programa: programa}) do
    %{id: programa.id,
      codigo: programa.codigo,
      nome: programa.nome}
  end
end
