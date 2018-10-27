#!/bin/bash

rm candidatos2018-latin1.csv
rm candidatos2018.csv

# junta os arquivos, selecionando só as colunas de interesse
for filename in *.csv
do
    echo "Processando $filename"
    cut $filename -d ';' -f 11,14-22,24-30,32,34-38 >> candidatos2018-latin1.csv
done

# converte para UTF-8
iconv -f ISO8859-1 -t UTF8 candidatos2018-latin1.csv > candidatos2018.csv

# remove as linhas com cabeçalhos
sed -i '/SG_UF/d' candidatos2018.csv

rm candidatos2018-latin1.csv

echo "Arquivo candidatos2018.csv gerado com sucesso."

