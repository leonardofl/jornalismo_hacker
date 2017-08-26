#!/bin/bash

headers='data_abertura;hora_abertura;prefeitura_regional;distrito;orgao;tema;assunto;servico;status_solicitacao;data_parecer;hora_parecer'
output='sp156.csv'
rm -f $output
echo $headers > $output
for f in originais/*.csv
do
    echo "Processing $f"
    tail -n +2 $f | iconv -f ISO-8859-9 -t UTF-8 | sed -r -e "s_([0-9]{2})/([0-9]{2})/([0-9]{4})_\3-\2-\1_g" -e "y/áÁàÀãÃâÂéÉêÊíÍóÓõÕôÔúÚçÇ/aAaAaAaAeEeEiIoOoOoOuUcC/" >> $output
done
