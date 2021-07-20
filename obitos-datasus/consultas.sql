-- circunstância de mortes 
> select CIRCOBITO, count(*) from obitos2019 group by CIRCOBITO order by count(*) desc;
CIRCOBITO,count(*)
NA,843962
Acidente,51358
"Homicídio",44644
"Suicídio",6659
Outro,63

-- circunstância de mortes de agentes policiais
> select CIRCOBITO, count(*) from obitos2019 where OCUP = 'AGENTE DE POLICIA' group by CIRCOBITO order by count(*) desc;
CIRCOBITO,count(*)
NA,1258
"Homicídio",385
Acidente,179
"Suicídio",46
Outro,1

-- porcentagem global de homicídios
> select 1.0 * (select count(*) from obitos2019 group by CIRCOBITO having CIRCOBITO = "Homicídio") / (select count(*) from obitos2019) as percent;
percent
0.0471581918397441

-- porcentagem de homicídios para agentes policiais
> select 1.0 * (select count(*) from obitos2019 where OCUP = 'AGENTE DE POLICIA' group by CIRCOBITO having CIRCOBITO = "Homicídio") / (select count(*) from obitos2019 where OCUP = 'AGENTE DE POLICIA') as percent;
percent
0.205992509363296

-- porcentagem global de suicídios
> select 1.0 * (select count(*) from obitos2019 group by CIRCOBITO having CIRCOBITO = "Suicídio") / (select count(*) from obitos2019) as percent;
percent
0.00703401127723448

-- porcentagem de suicídios para agentes policiais
> select 1.0 * (select count(*) from obitos2019 where OCUP = 'AGENTE DE POLICIA' group by CIRCOBITO having CIRCOBITO = "Suicídio") / (select count(*) from obitos2019 where OCUP = 'AGENTE DE POLICIA') as percent;
percent
0.0246120920278224

-- Contudo, obs: se policial envelhece, ele deixa de ser policial e vai morrer como APOSENTADO

-- Ocupações com mais acidentes de trabalho
> select OCUP, count(*) as qtd from obitos2019 where ACIDTRAB = 'Sim' group by OCUP order by qtd desc limit 10;
CARRETEIRO,438
"ABASTECEDOR DE LINHA DE PRODUCAO",252
NA,225
"CARPIDOR SEM ESPECIFICACAO",159
AGRICULTOR,158
"CONCRETISTA EM GERAL",113
"ELETRICISTA SEM ESPECIFICACAO",55
"AJUDANTE DE MAQUINA SEM ESPECIFICACAO",49
ESTUDANTE,43
APOSENTADO,36

-- A partir daí jornalista faz sua pesquisa pra entender quem é esse carreteiro
-- "Um Motorista Carreteiro ganha em média R$ 1.866,02 no mercado de trabalho brasileiro para uma jornada de trabalho de 44 horas semanais"
-- "Principais fatores de desinteresse da profissão de carreteiro"

-- Buscando por cids de acidente de trânsito
> select DESCR from cid where DESCR like '%acid';



