#!/usr/bin/python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
import xml.etree.ElementTree as etree

SIM = 'Sim'
NAO = 'Não'
ABSTENCAO = 'Abstenção'
OBSTRUCAO = 'Obstrução'

NOME_DO_ARQUIVO_COM_VOTACOES = 'votacoes.xml'
arquivo_votacoes = open(NOME_DO_ARQUIVO_COM_VOTACOES)
conteudo = arquivo_votacoes.read()
xml = etree.fromstring(conteudo)

votacoes_xml = xml.find('Votacoes')
for votacao_xml in votacoes_xml.findall('Votacao'):

    # processa votação
    descricao_votacao = votacao_xml.get('ObjVotacao')
    print 'Votação:', descricao_votacao
    votos_xml = votacao_xml.find('votos')
    votos = {} # { partido => { voto => quantidade } }
    for deputado_xml in votos_xml.findall('Deputado'):
        partido = deputado_xml.get('Partido')
        if not partido in votos:
            votos[partido] = {}
        dic_partido = votos[partido]
        voto = deputado_xml.get('Voto')
        dic_partido = votos.get(partido, {})
        quantidade_acumulada = dic_partido.get(voto, 0)
        dic_partido[voto] = quantidade_acumulada + 1

    # imprime resumo agregado da votação
    print '\nPartido \tSim \tNão \tAbstenção \tObstrução'
    for partido in votos.keys():
        dic_partido = votos[partido]
        sim = dic_partido.get(SIM, 0)
        nao = dic_partido.get(NAO, 0)
        abstencao = dic_partido.get(ABSTENCAO, 0)
        obstrucao = dic_partido.get(OBSTRUCAO, 0)
        print '%s \t\t%d \t%d \t%d \t\t%d' % (partido, sim, nao, abstencao, obstrucao)

    print '\n***********\n'


