defmodule InspecApi.V1.RelatorioView do
  use InspecApi.Web, :view

  def render("index.json", %{relatorios: relatorios}) do
    %{data: render_many(relatorios, InspecApi.V1.RelatorioView, "relatorio.json")}
  end

  def render("show.json", %{relatorio: relatorio}) do
    %{data: render_one(relatorio, InspecApi.V1.RelatorioView, "relatorio.json")}
  end

  def render("relatorio.json", %{relatorio: relatorio}) do
    %{id: relatorio.id,
      titulo: relatorio.titulo,
      conteudo: relatorio.conteudo}
  end
end
