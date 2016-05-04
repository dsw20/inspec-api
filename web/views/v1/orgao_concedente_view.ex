defmodule InspecApi.V1.OrgaoConcedenteView do
  use InspecApi.Web, :view

  def render("index.json", %{orgaos_responsaveis: orgaos_responsaveis}) do
    %{data: render_many(orgaos_responsaveis, InspecApi.V1.OrgaoConcedenteView, "orgao_concedente.json")}
  end

  def render("show.json", %{orgao_concedente: orgao_concedente}) do
    %{data: render_one(orgao_concedente, InspecApi.V1.OrgaoConcedenteView, "orgao_concedente.json")}
  end

  def render("orgao_concedente.json", %{orgao_concedente: orgao_concedente}) do
    %{id: orgao_concedente.id,
      codigo: orgao_concedente.codigo,
      nome: orgao_concedente.nome,
      responsavel_concedente: orgao_concedente.responsavel_concedente,
      cod_responsavel: orgao_concedente.cod_responsavel,
      cargo_responsavel: orgao_concedente.cargo_responsavel}
  end
end
