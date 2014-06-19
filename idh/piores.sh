#!/bin/bash
# Lista os municípios com pior IDH de cada estado
for uf in `cat estados.txt` ; do grep $uf idh.csv | tail -n 1 | cut -d ';' -f 2 ; done
