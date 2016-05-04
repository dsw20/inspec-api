defmodule InspecApi.V1.ProponenteView do
  use InspecApi.Web, :view

  def render("index.json", %{proponentes: proponentes}) do
    %{data: render_many(proponentes, InspecApi.V1.ProponenteView, "proponente.json")}
  end

  def render("show.json", %{proponente: proponente}) do
    %{data: render_one(proponente, InspecApi.V1.ProponenteView, "proponente.json")}
  end

  def render("proponente.json", %{proponente: proponente}) do
    %{id: proponente.id,
      codigo: proponente.codigo,
      nome: proponente.nome,
      esfera_administrativa: proponente.esfera_administrativa,
      regiao: proponente.regiao,
      uf: proponente.uf,
      municio: proponente.municio,
      endereco: proponente.endereco,
      bairro: proponente.bairro,
      cep: proponente.cep,
      responsavel: proponente.responsavel,
      qualificacao: proponente.qualificacao,
      codigo_reponsavel: proponente.codigo_reponsavel,
      nome_do_responsavel: proponente.nome_do_responsavel,
      cargo_do_responavel: proponente.cargo_do_responavel}
  end
end
