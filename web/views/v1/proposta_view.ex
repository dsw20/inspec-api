defmodule InspecApi.V1.PropostaView do
  use InspecApi.Web, :view

  def render("index.json", %{propostas: propostas}) do
    %{data: render_many(propostas, InspecApi.V1.PropostaView, "proposta.json")}
  end

  def render("show.json", %{proposta: proposta}) do
    %{data: render_one(proposta, InspecApi.V1.PropostaView, "proposta.json")}
  end

  def render("proposta.json", %{proposta: proposta}) do
    %{id: proposta.id,
      numero: proposta.numero,
      ano: proposta.ano,
      data_inclusao: proposta.data_inclusao}
  end
end
