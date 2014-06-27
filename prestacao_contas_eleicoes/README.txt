
Fonte dos dados:
Prestação de Contas das Campanhas Eleitorais
http://dados.gov.br/dataset/prestacao-de-contas-das-campanhas-eleitorais

Tutorial CSV -> sqlite:
http://imasters.com.br/banco-de-dados/dados-abertos-utilizando-sql-para-pequenas-analises-de-dados/

Convertendo codificação:
iconv -f ISO-8859-15 -t UTF-8 OriginalReceitasPartidosSP.txt > ReceitasPartidosSP.csv

Adaptando datas:
sed -i "s_\(..\)/\(..\)/\(....\)_\3-\2-\1_g" ReceitasPartidosSP.csv
sed -i "s_\(....-..-..\)\(..:\)_\1 \2_g" ReceitasPartidosSP.csv

Removendo as aspas
sed -i 's/"//g' ReceitasPartidosSP.csv 

Apagar linha do CSV que contém os título das colunas! (edição manual)

Elima espaços em brancos contínuos no fim da linha
sed -i 's/ *$//g' ReceitasPartidosSP.csv 

Trocar , por . nos números
sed -i 's/,\([0-9]\)/.\1/g' ReceitasPartidosSP.csv 

$sqlite3 ReceitasPartidosSP.sqlite 
sqlite> CREATE TABLE receitas(
  "DataHora" TEXT,
  "UF" TEXT,
  "TipoPartido" TEXT,
  "SiglaPartido" TEXT,
  "TipoDocumento" TEXT,
  "NumeroDocumento" TEXT,
  "CPFCNPJDoador" TEXT,
  "NomeDoador" TEXT,
  "DataReceita" TEXT,
  "ValorReceita" REAL,
  "TipoReceita" TEXT,
  "FonteRecurso" TEXT,
  "EspecieRecurso" TEXT,
  "DescricaoReceita" TEXT
);
sqlite> .separator ";"
sqlite> .import ReceitasPartidosSP.csv receitas

Obs: sqlite data types: http://www.sqlite.org/datatype3.html

