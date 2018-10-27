#!/bin/bash

rm -rf zonas2018-latin1
rm -rf zonas2018.csv

# junta os arquivos, selecionando só as colunas de interesse
for filename in *.CSV
do
    cut $filename -d ';' -f 11,14-19,22,24-32 >> zonas2018-latin1.csv
done

# converte para UTF-8
iconv -f ISO8859-1 -t UTF8 zonas2018-latin1.csv > zonas2018.csv

# remove as linhas com cabeçalhos
sed -i '/SG_UF/d' zonas2018.csv

echo "Arquivo zonas2018.csv gerado com sucesso."

