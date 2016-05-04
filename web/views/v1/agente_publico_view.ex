defmodule InspecApi.V1.AgentePublicoView do
  use InspecApi.Web, :view

  def render("index.json", %{agentes_publicos: agentes_publicos}) do
    %{data: render_many(agentes_publicos, InspecApi.V1.AgentePublicoView, "agente_publico.json")}
  end

  def render("show.json", %{agente_publico: agente_publico}) do
    %{data: render_one(agente_publico, InspecApi.V1.AgentePublicoView, "agente_publico.json")}
  end

  def render("agente_publico.json", %{agente_publico: agente_publico}) do
    %{id: agente_publico.id,
      nome: agente_publico.nome,
      descricao: agente_publico.descricao}
  end
end
