
Análise do IDH dos municípios brasileiros

== Objetivos ==

1) Obter lista de IDH dos municípios de um determinado estado.

2) Obter lista dos melhores de cada estado.

3) Obter lista dos piores de cada estado.


== Dados disponíveis ==

Lista de IDH dos municípios brasileiros

http://www.pnud.org.br/atlas/ranking/Ranking-IDHM-Municipios-2010.aspx

Antes de prosseguir, pense o que você faria com esses dados para alcançar os objetivos propostos.

== Passos realizados ==

Baixar o html orignial 
Arquivo gerado: original.html

Edição manual pra deixar no html só as linhas com dados 
Arquivo gerado: idh.html

Transformar o html em csv
Comando executado: ./html_to_csv.sh
Arquivo gerado: idh.csv

Obter lista por estado 
Comando executado: ./idh_por_estado.sh 'SP'
Arquivo gerado: idh_sp.csv

Para saber a posição de um município no ranking do estado, 
basta usar um editor de texto para ver em que linha o município está na lista gerada por idh_por_estado.sh.
O município de São Paulo, por exemplo, está 14o lugar no raking de IDH do estado de SP.

Obter lista limpa dos top 10 de um estado 
Comando executado: ./top10.sh idh_sp.csv
Arquivo gerado: top10_sp.txt

Obter melhores de cada estado
Comando executado: melhores.sh
Arquivo gerado: melhores.txt

Obter piores de cada estado 
Comando executado: ./piores.sh
Arquivo gerado: piores.txt

== Arquivos do repositório ==

Para ver os resultados gerados, explore os arquivos .txt.

Para ver os comandos utilizados, explore os arquivos .sh.

Você pode também executar os scripts (arquivos .sh) passando outros argumentos (ex: ./idh_por_estado.sh 'MA')!

== Código utilizado ==

Apenas 5 linhas de shell script, cada uma em um arquivo sh.

Comandos (da linha de comando) utilizados: cat, head, grep, sed, cut e for.

== Observações ==

Note o quão simples foi atingir o objetivo 1... 
Com apenas um comando (grep 'SP' idh.csv) obtivemos a lista dos IDHs dos municípios paulistas.
Por outro lado, atingir esse objetivo de forma manual seria dispendioso, tedioso e propenso a erros.
Isso mostra como o conhecimento de elementos básicos da linha de comando podem nos poupar muito trabalho!



