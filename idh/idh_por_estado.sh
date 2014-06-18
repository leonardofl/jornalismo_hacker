#!/bin/bash
#Obtem lista por estado
#Primeiro argumento: sigla do estado (ex: SP)

cat idh.csv | grep $1

