#!/bin/python
import sqlite3

conn = sqlite3.connect('candidatos.sqlite')
c = conn.cursor()

print('BEGIN;')

sql_select_despesas = "SELECT sequencial_candidato, sum(valor) FROM despesas GROUP BY sequencial_candidato;"
rows = c.execute(sql_select_despesas)

for row in rows:
    sequencial_candidato, total_despesas = row
    sql_update_despesas = "UPDATE candidatos SET total_despesas = %.2f WHERE sequencial_candidato = '%s';" \
        % (float(total_despesas), sequencial_candidato)
    print(sql_update_despesas)



sql_select_receitas = "SELECT sequencial_candidato, sum(valor) FROM receitas GROUP BY sequencial_candidato"
rows = c.execute(sql_select_receitas)

for row in rows:
    sequencial_candidato, total_receitas = row
    sql_update_receitas = "UPDATE candidatos SET total_receitas = %.2f WHERE sequencial_candidato = '%s';" \
        % (float(total_receitas), sequencial_candidato)
    print(sql_update_receitas)

print('COMMIT;')

#raise Exception('Rolling back')

conn.close()
