
Análise de doações para campanhas eleitorais feitas em 2014 aos partidos no estado de São Paulo 

Fonte dos dados:
http://dados.gov.br/dataset/prestacao-de-contas-das-campanhas-eleitorais

Método utilizado:
Conversão de CSV para banco de dados (SQLite) e utilização da linguagem SQL para explorar os dados.

Uma planilha (arquivo CSV) possibilita uma rápida visualização dos dados por qualquer leigo tecnológico.
Um arquivo CSV é uma planilha que pode ser aberta em qualquer editor de texto, 
pois nada mais é do que um conjunto de linhas onde cada linha possui valores separados por vírgulas ou algum outro delimitador 
(é bem comum a utilização do ponto-e-vírgula).
Se aberto no Excel ou no Calc, um arquivo CSV é exibido como uma planilha.

Embora ao utilizar ferramentas de planilha diversas análises sejam possíveis,
nesse caso de uso optamos por converter o CSV em uma *tabela* dentro de um banco de dados.
Uma vez que nossos dados estão em um banco de dados,
fica muito fácil "fazer perguntas" sobre os dados em uma linguagem de consulta chamada SQL.
A linguagem SQL possui expressões declarativas e é bem expressiva,
ou seja, com apenas um comando SQL uma pergunta jornalística interessante pode ser respondida.
O interessante é que a visualização de uma resposta de um comando SQL pode nos levar
a mais questionamentos que podem ser respondidos com outros comandos SQL.
Isso pode nos levar a um processo *investigativo* de exploração dos dados.

O arquivo preparacao.sh mostra como fizemos a conversão do arquivo CSV para o banco de dados.

O arquivo consultas.sql mostra exemplos de diversos comandos SQL 
que respondem a interessantes questões jornalísticas em um processo investigativo.

Bases de dados:
DoacoesPartidos2014SP.sqlite: https://drive.google.com/open?id=0B1JCC5LWFZb1dkZNTWxDZ1JtUVU
ReceitasPartidos2010.sqlite: https://drive.google.com/open?id=0B1JCC5LWFZb1aVhvRWhvNXZVcG8

