-------------------------------------
-- basicão

-- total óbitos
select count(*) from obitos2019
1349801
-- obs:
select round(1.0 * 552000 / count(*), 1) * 100 from obitos2019 
40.0 -- ie, só de covid morreu mais de 40% da quantidade total de mortes em 2019
-- dá uma boa dimensão do tamanho da tragédia

-- select alguns campos e limit
select TIPOBITO, SEXO, RACACOR, ESC, OCUP, CAUSABAS, CIRCOBITO, ACIDTRAB from obitos2019 limit 10;

-- distinct (explorando domínio)
select distinct TIPOBITO from obitos2019;
select distinct ESC from obitos2019;
select distinct CIRCOBITO from obitos2019;
select distinct ACIDTRAB from obitos2019;

-- where, min, max
> select min(DTOBITO) from obitos2019;
2019-01-01
> select max(DTOBITO) from obitos2019;
2019-12-31
> select COUNT(*) from obitos2019 where DTOBITO >= '2019-07-01';
684125
> select COUNT(*) from obitos2019 where DTOBITO < '2019-07-01';
665676

-- circunstância de mortes (group by)
> select CIRCOBITO, count(*) from obitos2019 group by CIRCOBITO order by count(*) desc;
"NA"	"1230542"
"Acidente"	"60215"
"Homicídio"	"42039"
"Suicídio"	"13009"
"Outro"	"3996"
-------------------------------------


-------------------------------------------
-- Ocupações com mais acidentes de trabalho
> select OCUP, count(*) as qtd from obitos2019 where ACIDTRAB = 'Sim' group by OCUP order by qtd desc limit 10;
"NA"	"440"
"Motorista de caminhão (rotas regionais e internacio"	"310"
"Pedreiro"	"185" -- construção
"Trabalhador agropecuário em geral"	"169"
"Trabalhador volante da agricultura"	"128"
"Motorista de carro de passeio"	"106" -- uber?
"Empregado doméstico nos serviços gerais"	"89"
"Produtor agrícola polivalente"	"72"
"Aposentado/Pensionista"	"70"
"Eletricista de instalações"	"62"
-- obs: em 2000 o primeiro lugar era CARRETEIRO; ou seja, isso não mudou
-- Buscado por carreteiro no Google...
-- "Um Motorista Carreteiro ganha em média R$ 1.866,02 no mercado de trabalho brasileiro para uma jornada de trabalho de 44 horas semanais"
-- "Principais fatores de desinteresse da profissão de carreteiro"
-------------------------------------------



--------------------------------------------
-- Explorando causas dos óbitos (ex: acidentes de trânsito)

-- Buscando por cids de acidente de trânsito
> select DESCR from cid where DESCR like '%acid%';
...
"V20.0 Condutor acid n-trans" -- que será "n-trans"? vou considerar
"V20.4 Condutor acid trans"
...

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
1349801
> select CAUSABAS, count(*) as qtd from obitos2019 where TIPOBITO = 'Não Fetal' group by CAUSABAS order by qtd desc limit 10;
"I219"	"92689"
"J189"	"50044"
"R99"	"48511"
"I64"	"33895"
"E149"	"28613"
"C349"	"27699"
"I10"	"26560"
"G309"	"21850"
"N390"	"21432"
"A419"	"19992"

> select obitos2019.CAUSABAS, cid.DESCR, count(*) as qtd from obitos2019 inner join cid on obitos2019.CAUSABAS = cid.CID10 where TIPOBITO = 'Não Fetal' group by CAUSABAS order by qtd desc limit 10;
"I219"	"I21.9 Infarto agudo do miocardio NE"	"92689"
"J189"	"J18.9 Pneumonia NE"	"50044"
"R99"	"R99   Outr causas mal definidas e NE mortalidade"	"48511"
"I64"	"I64   Acid vasc cerebr NE como hemorrag isquemico"	"33895"
"E149"	"E14.9 S/complic"	"28613"
"C349"	"C34.9 Bronquios ou pulmoes NE"	"27699"
"I10"	"I10   Hipertensao essencial"	"26560"
"G309"	"G30.9 Doenc de Alzheimer NE"	"21850" -- suspeito
"N390"	"N39.0 Infecc do trato urinario de localiz NE"	"21432"
"A419"	"A41.9 Septicemia NE"	"19992"

-- conferindo se join tá certo
$ grep I219 cid10.csv 
"3730","I219",NA,"N","S","I21.9 Infarto agudo do miocardio NE","5"
-- correto

-- porcentagem dos óbitos que é acidente de trânsito
> create temp view cid10_acid_trans as select CID10 from cid where DESCR like '%acid%trans%' and DESCR not like '%viajando ext%';
> select * from cid10_acid_trans;
> select count(*) from obitos2019 where CAUSABAS in (select CID10 from cid10_acid_trans);
30715 -- comparar com mortes na pandemia 
select round(1.0 * 30715 / 552, 1);
55.6 -- morreu gente pandemia 55 vezes do que normalmente se morre por ano em acidente de trânsito, o que já não é pouco
> select round(1.0 * (select count(*) from obitos2019 where CAUSABAS in (select CID10 from cid10_acid_trans)) / (select count(*) from obitos2019) * 100, 1);
2.3

-- porcentagem dos óbitos que é de covid
> create temp view cid10_covid as select CID10 from cid where DESCR like '%coronavirus%';
> select * from cid10_covid;
> select count(*) from obitos2019 where CAUSABAS in (select CID10 from cid10_covid);
0
--------------------------------------------









--------------------------------------
-- top causas morte por recorte social
> select SEXO, RACACOR, ESC, count(*) as qtd from obitos2019 where TIPOBITO = 'Não Fetal' group by SEXO, RACACOR, ESC;
> create temp view grupos as select SEXO, RACACOR, CAUSABAS, count(*) as qtd from obitos2019 where TIPOBITO = 'Não Fetal' group by SEXO, RACACOR, ESC;
> select SEXO, RACACOR, CAUSABAS, max(qtd) from grupos group by SEXO, RACACOR;
> select SEXO, RACACOR, cid.DESCR, max(qtd) from grupos join cid on grupos.CAUSABAS = cid.CID10 group by SEXO, RACACOR;
> create temp view grupos2 as select SEXO, RACACOR, ESC, CAUSABAS, count(*) as qtd from obitos2019 where TIPOBITO = 'Não Fetal' group by SEXO, RACACOR, ESC;
> select SEXO, RACACOR, ESC, cid.DESCR, max(qtd) from grupos2 join cid on grupos2.CAUSABAS = cid.CID10 group by SEXO, RACACOR, ESC;
> select SEXO, RACACOR, ESC, cid.DESCR, max(qtd) from grupos2 join cid on grupos2.CAUSABAS = cid.CID10 where SEXO = 'Masculino' and RACACOR = 'Preta' group by SEXO, RACACOR, ESC;
"Masculino"	"Preta"	"1 a 3 anos"	"I63.9 Infarto cerebral NE"	"14720"
"Masculino"	"Preta"	"12 anos ou mais"	"C85.1 Linfoma de celulas B NE"	"1356"
"Masculino"	"Preta"	"4 a 7 anos"	"X33.8 Outr locais espec"	"14310"
"Masculino"	"Preta"	"8 a 11 anos"	"V24.9 Motociclista NE acid trans"	"9258" -- destaque
"Masculino"	"Preta"	"NA"	"I21.3 Infarto agudo transmural miocardio loc NE"	"10607"
"Masculino"	"Preta"	"Nenhuma"	"R96.0 Morte instantanea"	"11439"
> select SEXO, RACACOR, ESC, cid.DESCR, max(qtd) from grupos2 join cid on grupos2.CAUSABAS = cid.CID10 where SEXO = 'Masculino' and RACACOR = 'Branca' group by SEXO, RACACOR, ESC;
"Masculino"	"Branca"	"1 a 3 anos"	"I63.9 Infarto cerebral NE"	"69156"
"Masculino"	"Branca"	"12 anos ou mais"	"W34.8 Outr locais espec"	"30810"
"Masculino"	"Branca"	"4 a 7 anos"	"W18.9 Local NE"	"88510"
"Masculino"	"Branca"	"8 a 11 anos"	"C34.9 Bronquios ou pulmoes NE"	"71395"
"Masculino"	"Branca"	"NA"	"J44.0 Doen pulm obs cron c/inf resp ag tr resp inf"	"62870"
"Masculino"	"Branca"	"Nenhuma"	"I21.9 Infarto agudo do miocardio NE"	"33059"
--------------------------------------



----------------------------------
-- polícia

-- ocupações
select distinct OCUP from obitos2019 order by OCUP;
"Abatedor"
"Acabador de calçados"
"Acabador de embalagens (flexíveis e cartotécnicas)"
...

-- ocupação policial
select distinct OCUP from obitos2019 where OCUP like '%POLICIA%' or OCUP like '%POLÍCIA%'  order by OCUP;
"Papiloscopista policial"
"Policial rodoviário federal"
"Sargento da policia militar"
"Subtenente da policia militar"
-- parece meio ruim o dado... e os soldados etc?

-- circunstância de mortes de policiais militares
> select CIRCOBITO, count(*) from obitos2019 where OCUP like '%policia militar' group by CIRCOBITO order by count(*) desc;
"NA"	"463"
"Acidente"	"33"
"Homicídio"	"19"
"Suicídio"	"4"

-- porcentagem global de homicídios
> select round(1.0 * (select count(*) from obitos2019 group by CIRCOBITO having CIRCOBITO = "Homicídio") / (select count(*) from obitos2019) * 100, 1) as percent;
3.1
-- quanto será que é em outros países?
-- qual seria a evolução histórica no Brasil?

-- porcentagem de homicídios para policiais militares
> select round(1.0 * (select count(*) from obitos2019 where OCUP like '%policia militar' group by CIRCOBITO having CIRCOBITO = "Homicídio") / (select count(*) from obitos2019 where OCUP like '%policia militar') * 100, 1) as percent;
3.7
-- similar à taxa global de homicídios

-- porcentagem global de suicídios
> select round(1.0 * (select count(*) from obitos2019 group by CIRCOBITO having CIRCOBITO = "Suicídio") / (select count(*) from obitos2019) * 100, 1) as percent;
1.0

-- porcentagem de suicídios para agentes policiais
> select round(1.0 * (select count(*) from obitos2019 where OCUP like '%policia militar' group by CIRCOBITO having CIRCOBITO = "Suicídio") / (select count(*) from obitos2019 where OCUP like '%policia militar') * 100, 1) as percent;
0.8
-- similar à taxa global de suicídios

-- Contudo, obs: se policial envelhece, ele deixa de ser policial e vai morrer como APOSENTADO
----------------------------------







