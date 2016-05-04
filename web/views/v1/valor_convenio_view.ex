defmodule InspecApi.V1.ValorConvenioView do
  use InspecApi.Web, :view

  def render("index.json", %{valores_convenio: valores_convenio}) do
    %{data: render_many(valores_convenio, InspecApi.V1.ValorConvenioView, "valor_convenio.json")}
  end

  def render("show.json", %{valor_convenio: valor_convenio}) do
    %{data: render_one(valor_convenio, InspecApi.V1.ValorConvenioView, "valor_convenio.json")}
  end

  def render("valor_convenio.json", %{valor_convenio: valor_convenio}) do
    %{id: valor_convenio.id,
      valor_global: valor_convenio.valor_global,
      repasse_uniao: valor_convenio.repasse_uniao,
      contrapartida_total: valor_convenio.contrapartida_total,
      contrapartida_total: valor_convenio.contrapartida_total,
      contrapartida_bens_servicos: valor_convenio.contrapartida_bens_servicos,
      valor_desenbolcado: valor_convenio.valor_desenbolcado,
      valor_empenhado: valor_convenio.valor_empenhado}
  end
end
