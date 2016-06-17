#!/usr/bin/python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
import xml.etree.ElementTree as etree
import sys

SIM = 'Sim'
NAO = 'Não'
ABSTENCAO = 'Abstenção'
OBSTRUCAO = 'Obstrução'

NORTE = 'Norte      '
NORDESTE = 'Nordeste   '
CENTRO_OESTE = 'CentroOeste'
SUDESTE = 'Sudeste    '
SUL =  'Sul        '

REGIAO_POR_UF = {
  'AC' : NORTE,
  'AL' : NORDESTE,
  'AP' : NORTE,
  'AM' : NORTE,
  'BA' : NORDESTE,
  'CE' : NORDESTE,
  'DF' : CENTRO_OESTE,
  'ES' : SUDESTE,
  'GO' : CENTRO_OESTE,
  'MA' : NORTE,
  'MT' : CENTRO_OESTE,
  'MS' : CENTRO_OESTE,
  'MG' : SUDESTE,
  'PA' : NORTE,
  'PB' : NORDESTE,
  'PR' : SUL,
  'PE' : NORDESTE,
  'PI' : NORDESTE,
  'RJ' : SUDESTE,
  'RN' : NORTE,
  'RS' : SUL,
  'RO' : NORTE,
  'RR' : NORTE,
  'SC' : NORTE,
  'SP' : SUDESTE,
  'SE' : NORDESTE,
  'TO' : NORTE 
}

NOME_DO_ARQUIVO_COM_VOTACOES = sys.argv[1]
arquivo_votacoes = open(NOME_DO_ARQUIVO_COM_VOTACOES)
conteudo = arquivo_votacoes.read()
xml = etree.fromstring(conteudo)

votacoes_xml = xml.find('Votacoes')
for votacao_xml in votacoes_xml.findall('Votacao'):

    # processa votação
    descricao_votacao = votacao_xml.get('ObjVotacao')
    print 'Votação:', descricao_votacao
    votos_xml = votacao_xml.find('votos')
    votos = {} # { região => { voto => quantidade } }
    for deputado_xml in votos_xml.findall('Deputado'):
        uf = deputado_xml.get('UF').strip()
        voto = deputado_xml.get('Voto').strip()
        regiao = REGIAO_POR_UF[uf] 
        if not regiao in votos:
            votos[regiao] = {}
        dic_regiao = votos[regiao]
        quantidade_acumulada = dic_regiao.get(voto, 0)
        dic_regiao[voto] = quantidade_acumulada + 1

    # imprime resumo agregado da votação
    print '\nRegião     \tSim \tNão \tAbstenção \tObstrução'
    for regiao in votos.keys():
        dic_regiao = votos[regiao]
        sim = dic_regiao.get(SIM, 0)
        nao = dic_regiao.get(NAO, 0)
        abstencao = dic_regiao.get(ABSTENCAO, 0)
        obstrucao = dic_regiao.get(OBSTRUCAO, 0)
        print '%s \t%d \t%d \t%d \t\t%d' % (regiao, sim, nao, abstencao, obstrucao)
    print '\n***********\n'


