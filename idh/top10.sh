#!/bin/bash
#Obtem os top10 (só o nome) a partir de um CSV 
#Primeiro argumento: nome do CSV (ex: idh_sp.txt)
head -n 10 $1 | cut -d ';' -f 2 | cut -d '(' -f 1

