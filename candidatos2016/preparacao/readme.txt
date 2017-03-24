Baixar base de candidatos: http://agencia.tse.jus.br/estatistica/sead/odsele/consulta_cand/consulta_cand_2016.zip

Baixar base de prestação de contas: http://agencia.tse.jus.br/estatistica/sead/odsele/prestacao_contas/prestacao_contas_final_2016.zip

Descompacte tudo.

Delete os arquivos:
    receitas_candidatos_prestacao_contas_final_2016_brasil.txt
    despesas_candidatos_prestacao_contas_final_2016_brasil.txt

Execute generate-csv-candidatos.sh

Execute generate-csvs-despesas-e-receitas.sh

Importe os csvs candidatos.csv, despesas.csv e receitas.csv no SQLite.

Para despesas e receitas, lembrar que coluna valor deve ser do tipo real.

Adicionar colunas total_despesas e total_receitas:
ALTER TABLE candidatos ADD COLUMN total_despesas real;
ALTER TABLE candidatos ADD COLUMN total_receitas real;
UPDATE candidatos SET total_despesas = 0, total_receitas = 0;

Criar índice:
CREATE INDEX idx_candidatos_sequencial ON candidatos (sequencial_candidato);
CREATE INDEX idx_receitas_sequencial ON receitas (sequencial_candidato);
CREATE INDEX idx_despesas_sequencial ON despesas (sequencial_candidato);
(Sem o primeiro índice, o próximo passo pode levar o dia todo!)

Executar:
./populate-totais.py > populate-totais.sql
cat populate-totais.sql | sqlite3 candidatos.sqlite

Mais índices para análises posteriores:
CREATE INDEX idx_candidatos_uf ON candidatos (uf);
CREATE INDEX idx_candidatos_cargo ON candidatos (cargo);
CREATE INDEX idx_candidatos_sexo ON candidatos (sexo);

Mais uma otimização:
UPDATE candidatos SET resultado = 'ELEITO' WHERE resultado like 'ELEITO%';
CREATE INDEX idx_candidatos_resultado ON candidatos (resultado);
Explicação: o like não permite aproveitar o uso de índice na coluna.
Como não nos interessa como o candidato foi eleito, apenas que foi eleito, então vamos simplificar essa informação.
