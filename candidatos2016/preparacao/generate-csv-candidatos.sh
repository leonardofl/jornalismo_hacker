#!/bin/bash

headers='uf; cod_municipio; municipio; cargo; sequencial_candidato; nome; numero_partido; sigla_partido; ocupacao; idade; sexo; grau_instrucao; estado_civil; cor; resultado'
#        6,  7,             8,         10,    12,                   15,   18,             19,            26,       29,    31,   33,             35,           37   45
echo $headers > candidatos.csv
for f in *.txt
do
    echo "Processing $f"
    cat $f | cut -d ';' -f 6,7,8,10,12,15,18,19,26,29,31,33,35,37,45 | iconv -f ISO-8859-9 -t UTF-8 >> candidatos.csv
done
