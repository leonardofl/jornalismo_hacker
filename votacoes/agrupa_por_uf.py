#!/usr/bin/python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
import xml.etree.ElementTree as etree
import sys

SIM = 'Sim'
NAO = 'Não'
ABSTENCAO = 'Abstenção'
OBSTRUCAO = 'Obstrução'

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
    votos = {} # { uf => { voto => quantidade } }
    for deputado_xml in votos_xml.findall('Deputado'):
        uf = deputado_xml.get('UF')
        voto = deputado_xml.get('Voto')
        if not uf in votos:
            votos[uf] = {}
        dic_uf = votos[uf]
        quantidade_acumulada = dic_uf.get(voto, 0)
        dic_uf[voto] = quantidade_acumulada + 1

    # imprime resumo agregado da votação
    print '\nUF \tSim \tNão \tAbstenção \tObstrução'
    for uf in votos.keys():
        dic_uf = votos[uf]
        sim = dic_uf.get(SIM, 0)
        nao = dic_uf.get(NAO, 0)
        abstencao = dic_uf.get(ABSTENCAO, 0)
        obstrucao = dic_uf.get(OBSTRUCAO, 0)
        print '%s \t%d \t%d \t%d \t\t%d' % (uf, sim, nao, abstencao, obstrucao)
    print '\n***********\n'


