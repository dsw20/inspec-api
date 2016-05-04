defmodule InspecApi.V1.ConvenioView do
  use InspecApi.Web, :view

  def render("index.json", %{convenios: convenios}) do
    %{data: render_many(convenios, InspecApi.V1.ConvenioView, "convenio.json")}
  end

  def render("show.json", %{convenio: convenio}) do
    %{data: render_one(convenio, InspecApi.V1.ConvenioView, "convenio.json")}
  end

  def render("convenio.json", %{convenio: convenio}) do
    %{id: convenio.id,
      numero: convenio.numero,
      modalidade: convenio.modalidade,
      situacao: convenio.situacao,
      subsituacao: convenio.subsituacao,
      objeto_convenio: convenio.objeto_convenio,
      justificativa: convenio.justificativa,
      processo_convenio: convenio.processo_convenio,
      numero_interno: convenio.numero_interno,
      esta_assinado: convenio.esta_assinado,
      tem_aditivo: convenio.tem_aditivo,
      esta_publicado: convenio.esta_publicado,
      esta_empenhado: convenio.esta_empenhado,
      tem_prorrogacao_oficio: convenio.tem_prorrogacao_oficio,
      permite_ajuste_cronograma: convenio.permite_ajuste_cronograma,
      qtd_empenhos: convenio.qtd_empenhos,
      qtd_aditivos: convenio.qtd_aditivos,
      qtd_prorrogas: convenio.qtd_prorrogas,
      codigo_acao: convenio.codigo_acao,
      situacao_publicacao: convenio.situacao_publicacao}
  end
end
