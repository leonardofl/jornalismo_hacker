#!/bin/bash

headers='sequencial_candidato; valor'

echo $headers > despesas.csv
for f in despesas_candidatos*.txt
do
    echo "Processing $f"
    cat $f | tail -n+2 | cut -d ';' -f 5,23 | sed 's/,/./' >> despesas.csv
done

echo $headers > receitas.csv
for f in receitas_candidatos*.txt
do
    echo "Processing $f"
    cat $f | tail -n+2 | cut -d ';' -f 5,26 | sed 's/,/./' >> receitas.csv
done
