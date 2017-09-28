
-- quantidade de doações registradas na base
sqlite> select count(*) from receitas;
347

-- partidos existentes na base de dados
sqlite> select distinct SiglaPartido from receitas;
PPS
PDT
PP
PTB
PSDB
PSDC
PSB
PV
PT
PR
PSOL

-- maior doação realizada
sqlite> select max(ValorReceita), NomeDoador, SiglaPartido from receitas;
3000000.0|MINERAÇÕES BRASILEIRAS REUNIDAS S/A MBR|PSDB
-- que tal estudar a relação entre essa empresa e o partido em questão?

-- menor doação realizada
sqlite> select min(ValorReceita), NomeDoador, SiglaPartido from receitas;
0.01||PT -- opa, essa de 1 centavo nem conta...
sqlite> select min(ValorReceita), NomeDoador, SiglaPartido from receitas where ValorReceita > 1;
20.0|MAURICIO BENEDINI BRUSADIN|PV

-- total de doações por partido
sqlite> select sum(ValorReceita) as soma, SiglaPartido from receitas group by SiglaPartido order by soma desc;
30606506.66|PSDB
13855550.26|PT
7536560.0|PSB
2255000.15|PPS
1622240.63|PR
770100.0|PP
552000.0|PTB
500000.0|PDT
350020.0|PV
25000.0|PSDC
8850.0|PSOL

-- doação média por partido
sqlite> select round(avg(ValorReceita),2) as soma, SiglaPartido from receitas group by SiglaPartido order by soma desc;
227140.17|PT
188414.0|PSB
183272.49|PSDB
166666.67|PDT
147476.42|PR
140937.51|PPS
110400.0|PTB
85566.67|PP
50002.86|PV
25000.0|PSDC
327.78|PSOL

-- quantidade de doações por partido
sqlite> select count(*) as count_doacoes, SiglaPartido from receitas group by SiglaPartido order by count_doacoes desc;
167|PSDB
61|PT
40|PSB
27|PSOL
16|PPS
11|PR
9|PP
7|PV
5|PTB
3|PDT
1|PSDC

-- doações para o PSOL
sqlite> select NomeDoador, ValorReceita from receitas where SiglaPartido = 'PSOL';
SEBASTIAO ALAIDE LOPES|300.0
AMERICA BENEDITA DE PAIVA RODRIGUES|300.0
ALEXANDRE BREVIGLIERI ALVES CASTILHO|300.0
MARIA JOSÉ DA SILVA BEZERRA|300.0
CREUSA LIMA DA SILVA|450.0
ALOE FERNANDES FELIPPE|900.0
VERSALHES REPRESENTAÇÕES COMERCIAIS S/C LTDA - ME|300.0
JULIA AZZI COLLET E SILVA|300.0
SANDRO APARECIDO NUNES|300.0
ANIZIO BATISTA DE OLIVEIRA|300.0
FLAVIA MUNHOZ DE CASTRO|300.0
DARIO DA SILVA MELO|300.0
OSMAR PEREIRA DE NEGREIROS|300.0
ALTAIR LOURENÇO DE LIMA|300.0
NEIDE REGES LIMA|300.0
ERIC NUNES DE SOUZA|300.0
LIVINO REINALDO REIS|300.0
ANTONIO BONFIM MOREIRA|300.0
RENATA DE OLIVEIRA SILVA|300.0
FABIO ANTONIO FERREIRA DA SILVA|300.0
LUIZ CARLOS DE SOUZA|300.0
AKIKO AKIYAMA|300.0
AGOSTINHO FERREIRA GOMES|300.0
LUIZ PEDRO BOM|300.0
JANDUHY CORDEIRO DE ALENCAR|300.0
MARIA DE LOURDES DE SOUZA|300.0
LUIZ PEDRO BOM|300.0
-- que tal examinar as doações para um partido de sua escolha? ^^

-- doações para o PSDC (único partido com apenas uma doação)
sqlite> select NomeDoador, ValorReceita from receitas where SiglaPartido = 'PSDC';
SAFRA LEASING SA ARRENDAMENTO MERCANTIL|25000.0

-- examiando campo DescricaoReceita
sqlite> select distinct SiglaPartido, DescricaoReceita from receitas where DescricaoReceita <> '';
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.559 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9869 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.559 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9892 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 22.163 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9894 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.559 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9895 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.559 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9902 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REF. A 10.134 TON. DE PAPEL RENOVA SOFT NAT, SENDO R$ 3.161.510 A TON., COM CUSTO AVALIADO 'PARCIAL' CONFORME N. F. 11008 DO PRÓPRIO DOADOR.OBS: SALDO DE 168 KG NO VALOR R$ 557.69 PERMANECEU NO PARTIDO NÃO UTILIZADO P/ FINS ELEITORAIS.
PR|DOAÇÃO ESTIMÁVEL REF. A 13.286.80 TON. DE PAPEL RENOVA SOFT NAT, SENDO R$ 3.161.510 A TON., COM CUSTO AVALIADO 'PARCIAL' CONF. N. F. 11004 DO DOADOR.OBS. SALDO DE 10.365.20 TON VALOR DE R$ 34.410.56 PERMANECEU NO PARTIDO NÃO UTILIZADO P/ FINS ELEITORAIS.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 22.618 TONELADAS DE PAPEL EXTRA ALVURA BRA 180G, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 11010 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 9.151 TONELADAS DE PAPEL EXTRA ALVURA BRA, SENDO R$ 2.927.84 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 11009 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.948 TONELADAS DE PAPEL EXTRA ALVURA BRA 75G 66X96 FL.500 C25, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 12035 DO PRÓPRIO DOADOR.
-- receita só é descrita para o PR
-- parece que o PR gosta de papel!

-- vamos examinar mais essas receitas de papel...
sqlite> select SiglaPartido, ValorReceita, NomeDoador from receitas where DescricaoReceita <> '';
PR|75500.06|M D PAPÉIS LTDA.
PR|75500.06|M D PAPÉIS LTDA.
PR|68134.21|M D PAPÉIS LTDA.
PR|75500.06|M D PAPÉIS LTDA.
PR|75500.06|M D PAPÉIS LTDA.
PR|33640.67|M D PAPÉIS LTDA.
PR|44104.28|M D PAPÉIS LTDA.
PR|69532.99|M D PAPÉIS LTDA.
PR|28132.3|M D PAPÉIS LTDA.
PR|76695.94|M D PAPÉIS LTDA.
-- hummm... pelo menos foram doadas por uma empresa de papel...

-- descobrindo tipos de receitas existentes
sqlite> select distinct TipoReceita from receitas;
Recursos de pessoas jurídicas
Recursos de pessoas físicas
RECURSOS DE PARTIDO POLÍTICO
RECURSOS DE OUTROS CANDIDATOS/COMITÊS
Recursos de origens não identificadas

-- valor de doações de pessoas jurídicas por partido
sqlite> select SiglaPartido, sum(ValorReceita) as soma from receitas where TipoReceita like '%jurídicas%' group by SiglaPartido order by soma desc;
PSDB|28751506.66
PT|12254300.25
PSB|4430000.0
PPS|2090000.0
PP|770000.0
PR|622240.63
PTB|550000.0
PDT|500000.0
PV|350000.0
PSDC|25000.0
PSOL|300.0

-- quantidade de doações de pessoas jurídicas por partido
sqlite> select count(*) as count_receitas, SiglaPartido from receitas where TipoReceita like '%jurídicas%' group by SiglaPartido order by count_receitas desc;
159|PSDB
55|PT
23|PSB
14|PPS
10|PR
8|PP
6|PV
3|PDT
3|PTB
1|PSDC
1|PSOL

-- maior doação feita por pessoa física
sqlite> select max(ValorReceita), NomeDoador, SiglaPartido from receitas where TipoReceita like '%físicas%';
100000.0|WALTER JORGE PAULO FILHO|PSDB
-- que tal googlar o nome desse cara ;)

-- as três maiores doações
sqlite> select SiglaPartido, ValorReceita, NomeDoador from receitas order by ValorReceita desc limit 3;
PSDB|3000000.0|MINERAÇÕES BRASILEIRAS REUNIDAS S/A MBR
PSDB|1350000.0|ULTRAFERTIL S/A
PSDB|1150000.0|Diretório Estadual/Distrital
-- que tal conferir as 10 maiores doações?

-- quantidade de doações de pessoas físicas por partido
sqlite> select count(*) as count_receitas, SiglaPartido from receitas where TipoReceita like '%físicas%' group by SiglaPartido order by count_receitas desc;
26|PSOL
6|PSDB
2|PTB
1|PP
1|PPS
1|PV

-- quantas doações existem
sqlite> select count(*) from receitas;
347

-- quantos doadores existem
sqlite> select count(distinct CPFCNPJDoador) from receitas;
162

-- CPF/CNPJ dos doadores que fizeram doações pra mais de um partido
sqlite>   select CPFCNPJDoador from (
            select SiglaPartido, CPFCNPJDoador from receitas group by SiglaPartido, CPFCNPJDoador
          ) group by CPFCNPJDoador having count(SiglaPartido) > 1;

-- quantos doadores doaram pra mais de um partido
sqlite> select count(*) from (
          select CPFCNPJDoador from (
            select SiglaPartido, CPFCNPJDoador from receitas group by SiglaPartido, CPFCNPJDoador
          ) group by CPFCNPJDoador having count(SiglaPartido) > 1
        )
25

-- doadores que doaram pra mais de um partido (juntos dos partidos que receberam a doação)
sqlite> select distinct SiglaPartido, NomeDoador from receitas where CPFCNPJDoador in (
          select CPFCNPJDoador from (
            select SiglaPartido, CPFCNPJDoador from receitas group by SiglaPartido, CPFCNPJDoador
          ) group by CPFCNPJDoador having count(SiglaPartido) > 1
        ) order by NomeDoador;
PPS|ARCOS DOURADOS COMERCIO DE ALIMENTOS LTDA
PSDB|ARCOS DOURADOS COMERCIO DE ALIMENTOS LTDA.
PSB|BANCO ALVORADA S.A
PPS|BANCO ALVORADA S/A
PTB|BANCO ALVORADA S/A
PSDB|BANCO ALVORADA S/A
PT|BANCO ALVORADA S/A
PPS|BANCO BRADESCO S/A
PSDB|BANCO BRADESCO S/A
PSB|BANCO BRADESCO S/A
PV|BANCO BRADESCO S/A
PT|BANCO BRADESCO S/A
PSDB|BRASKEM S/A
PV|BRASKEM S/A
PSB|CARIOCA CHRISTIANI NIELSEN ENG. S/A
PSDB|CARIOCA CHRISTIANI NIELSEN ENGENHARIA LTDA.
PT|CARIOCA CHRISTIANI NIELSEN ENGENHARIA S/A
PSB|CONSTRUCAP CCPS ENG. COM SA
PSDB|CONSTRUCAP CCPS ENGENHARIA E COMERCIO S/A
PT|CONSTRUCAP CCPS ENGENHARIA E COMERCIO S/A
PSDB|CONSTRUCAP COPS ENGENHARIA E COMERCIO S/A
PP|CONSTRUTORA OAS LTDA
PTB|CONSTRUTORA OAS LTDA
PSDB|CONSTRUTORA OAS LTDA.
PSDB|CONSTRUTORA QUEIROZ GALVAO S/A
PT|CONSTRUTORA QUIEROZ GALVAO
PSDB|CONSTRUÇÕES E COMERCIO CAMARGO CORREA S/A
PPS|CONSTRUÇÕES E COMERCIO CAMARGO CORREIA S/A
PSB|CONTAX S.A
PSDB|CONTAX S/A
PT|CONTRUTORA OAS LTDA.
PSDB|DIXER DISTRIBUIDORA DE BEBIDAS S/A
PT|DIXER DISTRIBUIDORA DE BEBIDAS S/A
PSDB|FERTILIZANTES FOSFATADOS S/A FOSFERTIL
PSB|FERTILIZANTES FOSFATADOS S/A FOSFERTIL
PDT|FOSFERTIL - FERTILIZANTES FOSFATADOS S/A
PSDB|GALVAO ENGENHARIA S/A
PPS|GALVÃO ENGENHARIA S/A
PT|GALVÃO ENGENHARIA S/A
PSB|GERDAU COMERCIAL DE AÇOS S/A
PT|GERDAU COMERCIAL DE AÇOS S/A
PSB|IGUATEMI EMPRESA DE SHOPPING CENT S/A
PSDB|IGUATEMI EMPRESA DE SHOPPING CENTERS S/A
PSB|IPIRANGA PRODUTOS DE PETROLEO S.A
PPS|IPIRANGA PRODUTOS DE PETROLEO S/A
PDT|LEYROZ CAXIAS INDUSTRIA C. LOGISTICA LTDA
PT|LEYROZ DE CAIXAS IND COM E LOG LTDA.
PSB|LEYROZ DE CAIXAS IND. COM. E LOGISTICA LTDA
PP|LIBRA HOLDING S.A.
PT|LIBRA HOLDING S/A
PSDB|LOGIC ENGENHARIA E CONSTRUÇÃO LTDA.
PV|LOGIC ENGENHARIA E CONSTRUÇÃO LTDA.
PT|LOGIC ENGENHARIA E CONSTRUÇÃO LTDA.
PPS|PLANOVA PLANEJAMENTO E CONSTRUÇÕES S/A
PSDB|PLANOVA PLANEJAMENTO E CONSTRUÇÕES S/A
PT|PRAIAMAR IND COM E DISTRIBUIÇÃO LTDA.
PSB|PRAIAMAR IND. COM. & DISTRIBUIDORA LTDA
PDT|PRAIAMAR INDUSTRIA E COMERCIO DISTRIB LTDA
PSDB|PRIMO SCHINCARIOL IND. DE CERVEJAS E REFRIGERANTES S/A
PT|PRIMO SCHINCARIOL INDUSTRIA DE CERVEJAS E REFRIGERANTES S/A
PP|QUATTOR PETROQUIMICA S.A
PPS|QUATTOR PETROQUIMICA S/A
PT|QUATTOR PETROQUIMICA S/A
PPS|RECOFARMA IND.DO AMAZONAS LTDA
PSDB|RECOFARMA INDUSTRIA DO AMAZONAS LTDA.
PPS|ULTRA FERTIL S/A
PSDB|ULTRAFERTIL S/A

-- mostra as maiores doações feitas ao PT
SELECT SiglaPartido, NomeDoador, ValorReceita FROM receitas WHERE SiglaPartido="PT" AND ValorReceita=(select max(ValorReceita) from receitas where SiglaPartido='PT');

-- mostra partidos que receberam mais de 1000000
SELECT SiglaPartido, Total FROM (SELECT SiglaPartido, SUM(ValorReceita) as Total FROM receitas GROUP BY SiglaPartido) WHERE Total>=1000000 ORDER BY Total desc;

-- mostra partidos que receberam mais de 1000000
SELECT SiglaPartido, SUM(ValorReceita) as Total FROM receitas GROUP BY Siglapartido HAVING total>=1000000 ORDER BY Total desc;



-- mostra as maiores doações de cada estado (usando só sp e mg)
SELECT * FROM (SELECT SiglaPartido, ValorReceita, "sp" as estado FROM receitas_sp ORDER BY ValorReceita desc LIMIT 3) UNION SELECT * FROM (SELECT SiglaPartido, ValorReceita, "mg" as estado FROM receitas_mg ORDER BY ValorReceita desc LIMIT 3) ORDER BY estado, ValorReceita DESC;




-- quantos por cento dos doares doam pra mais de um partido?

-- total doadores
select COUNT (distinct cpfcnpjdoador) from receitas_sp;
162

-- doadores que doaram pra mais de um partido
select count (*) from ( select cpfcnpjdoador, count(distinct siglapartido) as qtd_partidos from receitas_SP group by cpfcnpjdoador having qtd_partidos >1 );
25

-- 15% dos doadores doaram pra mais de um partido



-- quantos por cento dos doares pessoa jurídica doam pra mais de um partido?

-- doações de pessoas jurídicas
sqlite> select COUNT (distinct cpfcnpjdoador) from receitas_sp where TipoReceita like "%jurídicas";
119

-- doadores pessoas jurídicas que doam pra mais de um partido
select count (*) from ( select cpfcnpjdoador, count(distinct siglapartido) as qtd_partidos from receitas_SP where TipoReceita like "%jurídicas" group by cpfcnpjdoador having qtd_partidos >1 );
25

-- 21% dos doadores pessoas jurídicas doam pra mais de um partido



-- e dentre os maiores doadores? quantos doam pra mais de um partido?

-- quantas doações cada doador fez
select cpfcnpjdoador, count(distinct siglapartido) as qtd_partidos from receitas_SP group by cpfcnpjdoador;

-- transforma consulta anterior numa view
create temp view qtdDoacoes as select cpfcnpjdoador, count(distinct siglapartido) as qtd_partidos from receitas_SP group by cpfcnpjdoador;

-- cria view dos dez maiores doadores
create temp view dez as select cpfcnpjdoador from receitas_sp order by ValorReceita desc limit 10;

-- vê quantas doações os dez maiores doadores fizeram
select * from qtdDoacoes where qtdDoacoes.cpfcnpjdoador in (select cpfcnpjdoador from dez);
01340937000179|3
02476026000136|2
12101096000163|1
33412792000160|2
33417445000120|1
56993900000131|1
59941682000180|1
61649810000168|1

-- as 20% maiores doações
select siglapartido, valor, nomedoador from doacoes order by valor desc limit round(0.1 * (select count(*) from doacoes));
-- Temos um problema no limite inferior. Para complementar:
select min(valor) from (select valor from doacoes order by valor desc limit round(0.1 * (select count(*) from doacoes)));
select siglapartido, valor, nomedoador from doacoes where valor = (select min(valor) from (select valor from doacoes order by valor desc limit round(0.1 * (select count(*) from doacoes))));

-- partidos que não receberam da JBS
select distinct siglapartido from doacoes where siglapartido not in (select distinct siglapartido from doacoes where nomedoador like "%jbs%");

-- doadores das 50 maiores doações ao PT
select distinct NomeDoador from doacoes where SiglaPartido = 'PT' order by Valor desc limit 50;
