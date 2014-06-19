#!/bin/bash
# Lista os municípios com melhor IDH de cada estado
for uf in `cat estados.txt` ; do grep $uf idh.csv | head -n 1 | cut -d ';' -f 2 ; done

