#!/bin/bash
# Atenção: esse não é um script para ser executado de uma vez
# Os comandos devem ser efetuados um por um (há um passo manual no meio e os comandos do fim são dentro do shell do sqlite)

#Tutorial CSV -> sqlite:
#http://imasters.com.br/banco-de-dados/dados-abertos-utilizando-sql-para-pequenas-analises-de-dados/

#Convertendo codificação:
iconv -f ISO-8859-15 -t UTF-8 OriginalReceitasPartidosSP.txt > ReceitasPartidosSP.csv

#Adaptando datas:
sed -i "s_\(..\)/\(..\)/\(....\)_\3-\2-\1_g" ReceitasPartidosSP.csv
sed -i "s_\(....-..-..\)\(..:\)_\1 \2_g" ReceitasPartidosSP.csv

#Removendo as aspas
sed -i 's/"//g' ReceitasPartidosSP.csv 

#Apagar linha do CSV que contém os título das colunas! (edição manual)

#Elima espaços em brancos contínuos no fim da linha
sed -i 's/ *$//g' ReceitasPartidosSP.csv 

#Trocar , por . nos números
sed -i 's/,\([0-9]\)/.\1/g' ReceitasPartidosSP.csv 

#Acessa o banco de dados
sqlite3 ReceitasPartidosSP.sqlite 

#Cria a tabela
sqlite> CREATE TABLE receitas(
  "DataHora" TEXT,
  "UF" TEXT,
  "TipoPartido" TEXT,
  "SiglaPartido" TEXT,
  "TipoDocumento" TEXT,
  "NumeroDocumento" TEXT,
  "CPFCNPJDoador" TEXT,
  "NomeDoador" TEXT,
  "DataReceita" TEXT,
  "ValorReceita" REAL,
  "TipoReceita" TEXT,
  "FonteRecurso" TEXT,
  "EspecieRecurso" TEXT,
  "DescricaoReceita" TEXT
);

#Importa os dados
sqlite> .separator ";"
sqlite> .import ReceitasPartidosSP.csv receitas

#Obs: sqlite data types: http://www.sqlite.org/datatype3.html

