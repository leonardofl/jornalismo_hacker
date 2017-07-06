#!/bin/bash

# explicação dos campos sendo cortados
# 5,                    14,                 15,          23,            28,                    29,
# sequencial candidato, cpf/cnpj do doador, nome doador, valor receita, cpf doador originário, nome doador originário

headers='sequencial_candidato;identificacao_doador;nome_doador;valor_receita;identificacao_doador_originario;nome_doador_originarioo'
echo $headers > receitas2014.csv
for f in receitas_candidatos*.txt
do
    echo "Processing $f"
    cat $f | tail -n+2 | cut -d ';' -f 5,14,15,23,28,29 | iconv -f ISO-8859-9 -t UTF-8 | sed 's/,/./' >> receitas2014.csv
done
