#!/bin/bash

headers='uf; sequencial_candidato; nome; sigla_partido'
echo $headers > candidatos.csv
for f in *.txt
do
    echo "Processing $f"
    cat $f | cut -d ';' -f 6,12,15,19 | iconv -f ISO-8859-9 -t UTF-8 >> candidatos.csv
done
