#!/bin/python
import sqlite3

conn = sqlite3.connect('/home/leonardo/Documents/jornalismo_hacker/candidatos_2014/emendas-reforma-trabalhista.sqlite')
c = conn.cursor()

print('BEGIN;')

sql_select_receitas_sem_doador_originario = ( \
    "SELECT sequencial_candidato, identificacao_doador, nome_doador, sum(valor_receita) "
    "FROM receitas WHERE identificacao_doador_originario = '#NULO' "
    "GROUP BY sequencial_candidato, identificacao_doador;")
print(sql_select_receitas_sem_doador_originario)
rows = c.execute(sql_select_receitas_sem_doador_originario)

for row in rows:
    sequencial_candidato, identificacao_doador, nome_doador, valor = row
    nome_doador = nome_doador.replace("'", "")
    sql_update_receitas_consolidadas = (\
        "INSERT INTO receitas_consolidadas (sequencial_candidato, identificacao_doador, nome_doador, valor) "
        "VALUES ('%s', '%s', '%s', %.2f);" % (sequencial_candidato, identificacao_doador, nome_doador, valor))
    print(sql_update_receitas_consolidadas)

sql_select_receitas_com_doador_originario = ( \
    "SELECT sequencial_candidato, identificacao_doador, nome_doador, sum(valor_receita) "
    "FROM receitas WHERE identificacao_doador_originario != '#NULO' "
    "GROUP BY sequencial_candidato, identificacao_doador;")
print(sql_select_receitas_com_doador_originario)
rows = c.execute(sql_select_receitas_sem_doador_originario)

for row in rows:
    sequencial_candidato, identificacao_doador, nome_doador, valor = row
    nome_doador = nome_doador.replace("'", "")
    sql_update_receitas_consolidadas = (\
        "INSERT INTO receitas_consolidadas (sequencial_candidato, identificacao_doador, nome_doador, valor) "
        "VALUES ('%s', '%s', '%s', %.2f);" % (sequencial_candidato, identificacao_doador, nome_doador, valor))
    print(sql_update_receitas_consolidadas)

print('COMMIT;')

conn.close()
