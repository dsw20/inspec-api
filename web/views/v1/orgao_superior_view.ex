defmodule InspecApi.V1.OrgaoSuperiorView do
  use InspecApi.Web, :view

  def render("index.json", %{orgaos_superiores: orgaos_superiores}) do
    %{data: render_many(orgaos_superiores, InspecApi.V1.OrgaoSuperiorView, "orgao_superior.json")}
  end

  def render("show.json", %{orgao_superior: orgao_superior}) do
    %{data: render_one(orgao_superior, InspecApi.V1.OrgaoSuperiorView, "orgao_superior.json")}
  end

  def render("orgao_superior.json", %{orgao_superior: orgao_superior}) do
    %{id: orgao_superior.id,
      nome: orgao_superior.nome}
  end
end
