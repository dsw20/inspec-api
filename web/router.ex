defmodule InspecApi.Router do
  use InspecApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InspecApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", InspecApi do
    pipe_through :api

    resources "/v1/usuarios", V1.UsuarioController, except: [:new, :edit]
    resources "/v1/valores_convenio", V1.ValorConvenioController, except: [:new, :edit]
    resources "/v1/abaixos_assinado", V1.AbaixoAssinadoController, except: [:new, :edit]
    resources "/v1/agentes_publicos", V1.AgentePublicoController, except: [:new, :edit]
    resources "/v1/convenios", V1.ConvenioController, except: [:new, :edit]
    resources "/v1/orgaos_concedentes", V1.OrgaoConcedenteController, except: [:new, :edit]
    resources "/v1/datas_convenio", V1.DataConvenioController, except: [:new, :edit]
    resources "/v1/programas", V1.ProgramaController, except: [:new, :edit]
    resources "/v1/orgao_superiores", V1.OrgaoSuperiorController, except: [:new, :edit]
    resources "/v1/proponentes", V1.ProponenteController, except: [:new, :edit]
    resources "/v1/propostas", V1.PropostaController, except: [:new, :edit]
    resources "/v1/relatorios", V1.RelatorioController, except: [:new, :edit]
  end
end
