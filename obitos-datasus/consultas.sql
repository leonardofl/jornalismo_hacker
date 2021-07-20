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
> select DESCR from cid where DESCR like '%acid%';
-- ou
$ grep -i acid cid10.csv -- colorido ajuda
$ grep -i trans cid10.csv
$ grep -i trans cid10.csv | grep -i acid
$ grep -i trans cid10.csv | grep -i acid | wc -l
625
> select count(*) from cid where DESCR like '%acid%trans%';
622
> select count(*) from cid where DESCR like '%acid%trans%' and DESCR not like '%viajando ext%';
524
-- Vamos considerar esses caras como a categoria acidente de trânsito... talvez tenha coisa demais...

-- Buscando por covid
> select count(*) from cid where DESCR like '%covid%';
0
> select DESCR from cid where DESCR like '%corona%';
B34.2 Infecc p/coronavirus NE
B97.2 Coronavirus como doenc class outr cap
I24.0 Tromb coronaria q n result infarto miocardio
I25.4 Aneurisma de arteria coronaria
Q24.5 Malformacoes dos vasos coronarios
T46.3 Vasodilatadores coronarianos NCOP
Y52.3 Vasodilatadores coronarianos NCOP
Z95.1 Presenca de enxerto de ponte aortocoronaria
Z95.5 Presenca impl enxerto angioplastia coronaria
> select CID10, DESCR from cid where DESCR like '%coronavirus%';
B342|B34.2 Infecc p/coronavirus NE
B972|B97.2 Coronavirus como doenc class outr cap
-- Vamos considerar esses caras como a categoria covid... 

-- maiores causa morte globais
> select count(*) from obitos2019;
946686
> select CAUSABAS, count(*) as qtd from obitos2019 where TIPOBITO = 'Não Fetal' group by CAUSABAS order by qtd desc limit 10;
CAUSABAS|qtd
R98|78701
I219|58780
I64|43685
R99|39854
J449|23116
E149|18654
X959|16015
I500|14920
C349|14407
J180|13093
> select obitos2019.CAUSABAS, cid.DESCR, count(*) as qtd from obitos2019 inner join cid on obitos2019.CAUSABAS = cid.CID10 where TIPOBITO = 'Não Fetal' group by CAUSABAS order by qtd desc limit 10;
CAUSABAS|DESCR|qtd
R98|R98   Morte s/assist|78701
I219|I21.9 Infarto agudo do miocardio NE|58780
I64|I64   Acid vasc cerebr NE como hemorrag isquemico|43685
R99|R99   Outr causas mal definidas e NE mortalidade|39854
J449|J44.9 Doenc pulmonar obstrutiva cronica NE|23116
E149|E14.9 S/complic|18654
X959|X95.9 Local NE|16015
I500|I50.0 Insuf cardiaca congestiva|14920
C349|C34.9 Bronquios ou pulmoes NE|14407
J180|J18.0 Broncopneumonia NE|13093
-- conferindo se join tá certo
$ grep R98 cid10.csv 
"8350","R98",NA,"S","S","R98   Morte s/assist","5"
$ grep I219 cid10.csv 
"3730","I219",NA,"N","S","I21.9 Infarto agudo do miocardio NE","5"
$ grep I64 cid10.csv 
"3942","I64",NA,"S","S","I64   Acid vasc cerebr NE como hemorrag isquemico","5"
-- correto

-- porcentagem dos óbitos que é acidente de trânsito
> create temp view cid10_acid_trans as select CID10 from cid where DESCR like '%acid%trans%' and DESCR not like '%viajando ext%';
> select * from cid10_acid_trans;
> select count(*) from obitos2019 where CAUSABAS in (select CID10 from cid10_acid_trans);
27524
> select 1.0 * (select count(*) from obitos2019 where CAUSABAS in (select CID10 from cid10_acid_trans)) / (select count(*) from obitos2019);
0.0290740541214299

-- porcentagem dos óbitos que é acidente de covid
> create temp view cid10_covid as select CID10 from cid where DESCR like '%coronavirus%';
> select * from cid10_covid;
> select count(*) from obitos2019 where CAUSABAS in (select CID10 from cid10_covid);
0
> select 1.0 * (select count(*) from obitos2019 where CAUSABAS in (select CID10 from cid10_covid)) / (select count(*) from obitos2019) as percent;
percent
0.0
-- dados são na verdade todos de 2000

> select min(DTOBITO) from obitos2019;
2000-01-01
> select max(DTOBITO) from obitos2019;
NA
> select distinct DTOBITO from obitos2019 order by DTOBITO desc limit 5;
NA
2000-12-31
2000-12-30
2000-12-29
2000-12-28
> select min(DTOBITO) from obitos2000;
-00-20
> select distinct DTOBITO from obitos2000 order by DTOBITO limit 5;
-00-20 -- aqui deve ter rolado alguma barbeiragem no update da preparação
00-20-02
2000-01-01
2000-01-02
2000-01-03
> select max(DTOBITO) from obitos2000;
2000-12-31

-- top causas morte por recorte social
> select SEXO, RACACOR, ESC, count(*) as qtd from obitos2019 group by SEXO, RACACOR, ESC;
> create temp view grupos as select SEXO, RACACOR, CAUSABAS, count(*) as qtd from obitos2019 where TIPOBITO = 'Não Fetal' group by SEXO, RACACOR, ESC;
> select SEXO, RACACOR, CAUSABAS, max(qtd) from grupos group by SEXO, RACACOR;
> select SEXO, RACACOR, cid.DESCR, max(qtd) from grupos join cid on grupos.CAUSABAS = cid.CID10 group by SEXO, RACACOR;
> create temp view grupos2 as select SEXO, RACACOR, ESC, CAUSABAS, count(*) as qtd from obitos2019 where TIPOBITO = 'Não Fetal' group by SEXO, RACACOR, ESC;
> select SEXO, RACACOR, ESC, cid.DESCR, max(qtd) from grupos2 join cid on grupos2.CAUSABAS = cid.CID10 group by SEXO, RACACOR, ESC;
> select SEXO, RACACOR, ESC, cid.DESCR, max(qtd) from grupos2 join cid on grupos2.CAUSABAS = cid.CID10 where SEXO = 'Masculino' and RACACOR = 'Preta' group by SEXO, RACACOR, ESC;
SEXO|RACACOR|ESC|DESCR|max(qtd)
Masculino|Preta|1 a 3 anos|C73   Neopl malig da gland tireoide|7841
Masculino|Preta|12 anos ou mais|V29.9 Motociclista acid trans NE|514
Masculino|Preta|4 a 7 anos|B21.3 Doenc p/HIV out neop mal tec linf hemat corr|5262
Masculino|Preta|8 a 11 anos|X99.9 Local NE|1678
Masculino|Preta|9 a 11 anos|I21.9 Infarto agudo do miocardio NE|7
Masculino|Preta|NA|C61   Neopl malig da prostata|13970
Masculino|Preta|Nenhuma|V48.9 Ocupante NE acid trans|7587
> select SEXO, RACACOR, ESC, cid.DESCR, max(qtd) from grupos2 join cid on grupos2.CAUSABAS = cid.CID10 where SEXO = 'Masculino' and RACACOR = 'Branca' group by SEXO, RACACOR, ESC;
SEXO|RACACOR|ESC|DESCR|max(qtd)
Masculino|Branca|1 a 3 anos|K63.1 Perfuracao do intestino|59993
Masculino|Branca|12 anos ou mais|E22.2 Sindr secrecao inadeq hormonio antidiuretico|13977
Masculino|Branca|4 a 7 anos|I63.1 Infarto cerebr dev embol arterias pre-cerebr|44570
Masculino|Branca|8 a 11 anos|C92.0 Leucemia mieloide aguda|19388
Masculino|Branca|9 a 11 anos|C34.9 Bronquios ou pulmoes NE|27
Masculino|Branca|NA|P21.9 Asfixia ao nascer NE|107637
Masculino|Branca|Nenhuma|I21.9 Infarto agudo do miocardio NE|39218



