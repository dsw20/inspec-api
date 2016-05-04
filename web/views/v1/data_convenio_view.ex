defmodule InspecApi.V1.DataConvenioView do
  use InspecApi.Web, :view

  def render("index.json", %{datas_convenio: datas_convenio}) do
    %{data: render_many(datas_convenio, InspecApi.V1.DataConvenioView, "data_convenio.json")}
  end

  def render("show.json", %{data_convenio: data_convenio}) do
    %{data: render_one(data_convenio, InspecApi.V1.DataConvenioView, "data_convenio.json")}
  end

  def render("data_convenio.json", %{data_convenio: data_convenio}) do
    %{id: data_convenio.id,
      ano_convenio: data_convenio.ano_convenio,
      inicio_vigencia: data_convenio.inicio_vigencia,
      fim_vigencia: data_convenio.fim_vigencia,
      data_assinatura: data_convenio.data_assinatura,
      publicacao: data_convenio.publicacao,
      ultimo_empenho: data_convenio.ultimo_empenho,
      ultimo_pagamento: data_convenio.ultimo_pagamento}
  end
end
