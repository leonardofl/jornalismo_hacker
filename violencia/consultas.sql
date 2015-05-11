-- os 10 municípios paulistas com mais de 100000 habitantes com mais homicídios

sqlite> SELECT homicidios.*, homicidios_jovens.taxa as taxa_jovem FROM homicidios_jovens, homicidios WHERE homicidios.municipio = homicidios_jovens.municipio AND homicidios.uf = "SP" AND homicidios.populacao > 100000 ORDER BY homicidios.taxa DESC LIMIT 10;
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

SELECT homicidios.*, homicidios_jovens.taxa as taxa_jovem FROM homicidios_jovens, homicidios WHERE homicidios.municipio = homicidios_jovens.municipio AND homicidios.municipio IN ("São Paulo", "Pindamonhangaba", "Taubaté", "Guaratinguetá", "São José dos Campos", "Lorena", "Botucatu", "Sorocaba", "Bauru", "Rancharia", "Presidente Prudente", "Caraguatatuba", "Embu", "Osasco", "Barueri", "Diadema") ORDER BY homicidios.taxa desc;

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

SELECT homicidios.*, homicidios_jovens.taxa as taxa_jovem FROM homicidios_jovens JOIN homicidios ON homicidios.municipio = homicidios_jovens.municipio WHERE homicidios.populacao >= 1000000 ORDER BY homicidios.taxa desc;

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
