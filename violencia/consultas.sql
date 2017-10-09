-- os 10 municípios paulistas com mais de 100000 habitantes com mais homicídios
sqlite> SELECT homicidios.*, homicidios_jovens.taxa as taxa_jovem 
FROM homicidios_jovens, homicidios 
WHERE homicidios.municipio = homicidios_jovens.municipio AND homicidios.uf = "SP" AND homicidios.populacao > 100000 ORDER BY homicidios.taxa DESC LIMIT 10;
municipio             uf          populacao   homicidios  taxa        ranking_nacional  taxa_jovem
--------------------  ----------  ----------  ----------  ----------  ----------------  ----------
Itapecerica da Serra  SP          156077      75          48.1        300               36.3
Itapevi               SP          206558      70          33.9        603               52.8
Presidente Prudente   SP          210393      70          33.3        623               38.7
Jacareí              SP          214223      69          32.2        646               76.4
Taboão da Serra      SP          251608      77          30.6        690               45.0
Itaquaquecetuba       SP          329144      99          30.1        702               40.9
Caraguatatuba         SP          104150      31          29.8        713               64.7
Ferraz de Vasconcelo  SP          172222      50          29.0        735               51.5
Taubaté              SP          283899      80          28.2        786               62.2
Hortolândia          SP          198758      55          27.7        802               52.8

-- violência em alguns municípios de interesse
SELECT homicidios.*, homicidios_jovens.taxa as taxa_jovem 
FROM homicidios_jovens, homicidios 
WHERE homicidios.municipio = homicidios_jovens.municipio AND homicidios.municipio IN ("São Paulo", "Pindamonhangaba", "Taubaté", "Guaratinguetá", "São José dos Campos", "Lorena", "Botucatu", "Sorocaba", "Bauru", "Rancharia", "Presidente Prudente", "Caraguatatuba", "Embu", "Osasco", "Barueri", "Diadema") 
ORDER BY homicidios.taxa desc;

municipio            uf          populacao   homicidios  taxa        ranking_nacional  taxa_jovem
-------------------  ----------  ----------  ----------  ----------  ----------------  ----------
Presidente Prudente  SP          210393      70          33.3        623               38.7
Caraguatatuba        SP          104150      31          29.8        713               64.7
Taubaté             SP          283899      80          28.2        786               62.2
Embu                 SP          245148      67          27.3        819               45.0
Diadema              SP          390980      97          24.8        936               39.3
Guaratinguetá       SP          113258      27          23.8        973               52.8
Lorena               SP          83224       19          22.8        1027              56.0
Osasco               SP          668877      132         19.7        1178              35.8
Barueri              SP          245652      46          18.7        1266              33.0
Sorocaba             SP          600692      105         17.5        1369              23.8
São Paulo           SP          11376685    1752        15.4        1554              28.7
Bauru                SP          348146      50          14.4        1634              23.6
Botucatu             SP          130201      16          12.3        1778              12.1
Pindamonhangaba      SP          150162      18          12.0        1795              17.6
São José dos Camp  SP          643603      72          11.2        1851              14.5
Rancharia            SP          28809       2           6.9         2298              **

-- homicídios nas cidades brasileiras com mais de um milhão de habitantes
SELECT homicidios.*, homicidios_jovens.taxa as taxa_jovem 
FROM homicidios_jovens JOIN homicidios ON homicidios.municipio = homicidios_jovens.municipio 
WHERE homicidios.populacao >= 1000000 
ORDER BY homicidios.taxa desc;

municipio   uf          populacao   homicidios  taxa        ranking_nacional  taxa_jovem
----------  ----------  ----------  ----------  ----------  ----------------  ----------
Fortaleza   CE          2500194     1920        76.8        60                176.6
São Luís  MA          1039610     651         62.6        130               119.9
Salvador    BA          2710968     1644        60.6        156               138.5
Manaus      AM          1861838     1052        56.5        196               108.3
Goiânia    GO          1333767     739         55.4        207               106.2
Recife      PE          1555039     809         52.0        251               116.2
Belém      PA          1410430     643         45.6        343               101.8
Belém      PA          1410430     643         45.6        343               **
Belém      PA          1410430     643         45.6        343               **
Porto Aleg  RS          1416714     601         42.4        402               97.3
Curitiba    PR          1776761     743         41.8        417               86.1
Belo Horiz  MG          2395785     973         40.6        444               91.9
Brasília   DF          2648532     1031        38.9        478               74.5
São Gonç  RJ          1016128     308         30.3        700               67.2
Rio de Jan  RJ          6390290     1372        21.5        1091              42.4
Guarulhos   SP          1244518     268         21.5        1085              40.8
São Paulo  SP          11376685    1752        15.4        1554              28.7
Campinas    SP          1098630     156         14.2        1647              26.4   

-- violência por UF
SELECT uf, sum(homicidios) as total_homicidios, sum(populacao) as total_populacao, 
1.0*sum(homicidios)/sum(populacao) as taxa_homicidios 
FROM homicidios 
GROUP BY uf 
ORDER BY taxa_homicidios DESC;
uf              total_homicidios    total_populacao     taxa_homicidios
----------------------------------------------------------------------------
AL				2046				3165472				0.000646349106863052
ES				1693				3578067				0.000473160508173827
CE				3839				8606005				0.00044608386818274
GO				2725				6154996				0.000442729775941365
BA				5935				14175341			0.000418684813296555
SE				883				    2110867				0.000418311527917202
PA				3261				7822205				0.000416890122414332
PB				1519				3815171				0.000398147291432022
DF				1031				2648532				0.000389272245908299
PE				3313				8931028				0.00037095393721753
AM				1317				3590985				0.000366751740817631
AP				251			     	698602				0.000359288979991469
RR				166				    469524				0.000353549552312555
RN				1121				3228198				0.000347252553901588
MT				1070				3115336				0.000343462149829103
RO				523				    1590011				0.000328928542003797
PR				3464				10577755			0.000327479696778759
RJ				4589				16231365			0.000282724219435642
AC				209				    758786				0.000275439979124549
MS				679				    2505088				0.000271048362372899
TO				371				    1417694				0.000261692579639894
MA				1749				6714314				0.000260488264326035
MG				4534				19855332			0.000228351759618021
RS				2363				10770603			0.000219393473141662
PI				544				    3160748				0.000172111158497925
SP				6314				41901219			0.00015068774013472
SC				816				    6383286				0.00012783384607865

-- homicidios na maior cidade de cada UF
select uf, taxa, municipio, max(populacao) from homicidios
group by uf
order by taxa desc;
uf          taxa        municipio          max(populacao)
----------  ----------  -----------------  --------------
AL          90.0        Maceió             953393        
CE          76.8        Fortaleza          2500194       
PB          76.5        João Pessoa        742478        
MA          62.6        São Luís           1039610       
BA          60.6        Salvador           2710968       
SE          59.7        Aracaju            587701        
AM          56.5        Manaus             1861838       
RN          55.8        Natal              817590        
GO          55.4        Goiânia            1333767       
PE          52.0        Recife             1555039       
ES          49.2        Vila Velha         424948        
PA          45.6        Belém              1410430       
RO          44.7        Porto Velho        442701        
MT          44.0        Cuiabá             561329        
RS          42.4        Porto Alegre       1416714       
PR          41.8        Curitiba           1776761       
PI          41.1        Teresina           830231        
MG          40.6        Belo Horizonte     2395785       
DF          38.9        Brasília           2648532       
AP          36.8        Macapá             415554        
AC          33.0        Rio Branco         348354        
RR          27.9        Boa Vista          296959        
TO          25.6        Palmas             242070        
MS          22.6        Campo Grande       805397        
RJ          21.5        Rio de Janeiro     6390290       
SC          16.3        Joinville          526338        
SP          15.4        São Paulo          11376685


