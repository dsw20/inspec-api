import pandas as pd
import argparse
import sys

parser = argparse.ArgumentParser(
    description='Parser para dados livres de convenios')

parser.add_argument('-v', '--verbose', dest='verbose', action='store_true',
                    default=False)

options = parser.parse_args(sys.argv[1:])

try:
    data = pd.read_csv('05_PropostasPrograma.csv', ';', header=0)
except:
    print ('Erro ao ler o arquivo 05_PropostasPrograma.csv, verifique se ele\
se encontra no mesmo diretorio que parser.py \n\n\n\n')

def parse_proposta():
    proposta = data[['ANO_PROPOSTA', 'NR_PROPOSTA', 'DT_PROPOSTA',
                     'ID_PROPOSTA']]
    proposta = proposta[pd.notnull(proposta)]
    proposta.to_csv('proposta.csv', sep=';', encoding='utf-8')
    if options.verbose:
        print proposta.head(5)


def parse_convenio():
    convenio = data[['ANO_CONVENIO', 'NR_CONVENIO', 'TX_OBJETO_CONVENIO',
        'ID_CONVENIO', 'TX_MODALIDADE', 'TX_SITUACAO', 'TX_SUBSITUACAO',
        'TX_JUSTIFICATIVA', 'DT_ASSINATURA', 'DT_PUBLICACAO',
        'ID_PROP_PROGRAMA']]
    convenio["ASSINADO"] = convenio["DT_ASSINATURA"].isnull().map(
        lambda x: False if x == True else True)
    convenio["PUBLICADO"] = convenio["DT_PUBLICACAO"].isnull().map(
        lambda x: False if x == True else True)
    convenio.to_csv('convenio.csv', sep=';', encoding='utf-8')
    if options.verbose:
        print convenio.head(5)


def parse_datas():
    datas = data[['ANO_CONVENIO', 'DT_INICIO_VIGENCIA', 'DT_FIM_VIGENCIA',
        'DT_ASSINATURA', 'DT_PUBLICACAO']]
    datas.to_csv('datas.csv', sep=';', encoding='utf-8')
    if options.verbose:
        print datas.head(5)


def parse_proponente():
    proponente = data[['CD_IDENTIF_PROPONENTE', 'NM_PROPONENTE',
        'TX_ESFERA_ADM_PROPONENTE', 'TX_REGIAO_PROPONENTE', 'UF_PROPONENTE',
        'NM_MUNICIPIO_PROPONENTE', 'TX_QUALIFIC_PROPONENTE',
        'NM_RESPONS_PROPONENTE', 'CD_RESPONS_PROPONENTE']]
    proponente.to_csv('proponente.csv', sep=';', encoding='utf-8')
    if options.verbose:
        print proponente.head(5) 


def parse_responsavel():
    responsavel = data[['NM_RESPONS_PROPONENTE', 'CD_RESPONS_PROPONENTE',
        'NM_RESPONS_CONCEDENTE', 'CD_RESPONS_CONCEDENTE']]
    responsavel.to_csv('responsavel.csv', sep=';', encoding='utf-8')
    if options.verbose:
        print responsavel.head(5) 


def parse_valores():
    valores = data[['VL_GLOBAL', 'VL_REPASSE', 'VL_REPASSE_EXERC_ATUAL',
        'VL_CONTRAPARTIDA', 'VL_CONTRAPARTIDA_FINANC',
        'VL_CONTRAPARTIDA_BENS_SERV']]
    valores.to_csv('valores.csv', sep=';', encoding='utf-8')
    if options.verbose:
        print valores.head(5) 


def parse_concedente():
    concedente = data[['NM_RESPONS_CONCEDENTE', 'CD_RESPONS_CONCEDENTE',
        'NM_ORGAO_CONCEDENTE', 'CD_ORGAO_CONCEDENTE']]
    concedente.to_csv('concedente.csv', sep=';', encoding='utf-8')
    if options.verbose:
        print concedente.head(5) 


def parse_superior():
    superior = data[['NM_ORGAO_SUPERIOR',  'CD_ORGAO_SUPERIOR']]
    superior.to_csv('superior.csv', sep=';', encoding='utf-8')
    if options.verbose:
        print superior.head(5) 


def parse_programa():
    programa = data[['CD_PROGRAMA', 'NM_PROGRAMA', 'CD_ACAO_PROGRAMA']]
    programa.to_csv('programa.csv', sep=';', encoding='utf-8')
    if options.verbose:
        print programa.head(5) 


if __name__ == "__main__":
    parse_proposta()
    parse_convenio()
    parse_datas()
    parse_proponente()
    parse_responsavel()
    parse_valores()
    parse_concedente()
    parse_superior()
    parse_programa()
