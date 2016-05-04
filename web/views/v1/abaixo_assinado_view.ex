defmodule InspecApi.V1.AbaixoAssinadoView do
  use InspecApi.Web, :view

  def render("index.json", %{abasixo_assinados: abasixo_assinados}) do
    %{data: render_many(abasixo_assinados, InspecApi.V1.AbaixoAssinadoView, "abaixo_assinado.json")}
  end

  def render("show.json", %{abaixo_assinado: abaixo_assinado}) do
    %{data: render_one(abaixo_assinado, InspecApi.V1.AbaixoAssinadoView, "abaixo_assinado.json")}
  end

  def render("abaixo_assinado.json", %{abaixo_assinado: abaixo_assinado}) do
    %{id: abaixo_assinado.id,
      nome: abaixo_assinado.nome,
      descricao: abaixo_assinado.descricao,
      status: abaixo_assinado.status}
  end
end
