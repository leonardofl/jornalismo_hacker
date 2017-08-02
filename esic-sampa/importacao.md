
## Fonte dos dados

http://dados.prefeitura.sp.gov.br/dataset/base-de-dados-do-sistema-e-sic

Dados acessados em agosto de 2017.

## Passos iniciais

Converter tudo pra UTF8
conv-uft8.sh

Esconder arquivos originais
mkdir originais
mv *.csv originais/

##Trabalhando com pedidos

cp utf8/05db-dbo-pedido.csv pedidos.csv
Adaptando datas:
sed -i "s_\(..\)/\(..\)/\(....\)_\3-\2-\1_g" pedidos.csv
Importando para esic-sampa.sqlite (tabela pedidos) via SQLite Manager. 
Utilizando tipo INTEGER para os códigos.

##Trabalhando com atendimentos

cp utf8/06db-dbo-atendimento-pedido.csv atendimentos.csv
Adaptando datas:
sed -ri "s_([0-9]{1,2})/([0-9]{1,2})/([0-9]{2}) [0-9]{1,2}:[0-9]{2} [AP]M_20\3-\2-\1_" atendimentos.csv
Obs: estamos desprezando as horas, que provavelmente não serão de interesse.
Deixando meses com dois dígitos:
sed -ri "s_([0-9]{4}-)([0-9]-)_\10\2_" atendimentos.csv
Deixando dias com dois dígitos:
sed -ri "s_([0-9]{4}-[0-9]{2}-)([0-9][^0-9])_\10\2_" atendimentos.csv
Importando para esic-sampa.sqlite (tabela atendimentos) via SQLite Manager.
Utilizando tipo INTEGER para os códigos.

##Trabalhando com solicitantes

cp utf8/09db-dbo-solicitante.csv solicitantes.csv
Problemas dos dados:
Os meta-dados (arquivos de 2 a 4) dizem respeito ao banco original, e não de fato ao que foi exportado.
Na tabela de solicitantes não temos os domínios de profissão, escolaridade, área de atuação e tipo de instituição.
Também não temos o significado do "cd_cep_tratado".
Importando para esic-sampa.sqlite (tabela solicitantes) via SQLite Manager.
Utilizando tipo INTEGER para os códigos.

