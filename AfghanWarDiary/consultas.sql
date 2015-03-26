
-- quantidade total de inimigos mortos
select sum(enemy_kia) from diary;

-- quantidade total de aliados mortos
select sum(friendly_kia) from diary;

-- quantidade total de civis mortos
select sum(civilian_kia) from diary;

-- quantidades de mortes inimigas nas ações
select distinct enemy_kia from diary order by enemy_kia;
-- com isso vimos que 181 foi a maior quantidade de inimigos mortos em uma ação

-- seleciona ações com maior quantidade de mortes de inimigos
select friendly_kia, enemy_kia, civilian_kia, host_nation_kia from diary where enemy_kia < 200 order by enemy_kia desc limit 10;
-- o "< 200" foi um hack pra se livrar dos enemy_kia que estavam vazio
-- mas dá pra fazer assim também:
select friendly_kia, enemy_kia, civilian_kia, host_nation_kia from diary where enemy_kia != ''  order by enemy_kia desc limit 10;

-- ah, nessas horas ativar o ".headers on" e o ".mode column" pode ser legal

-- exibir na 5a coluna o total de mortes na ação
select friendly_kia, enemy_kia, civilian_kia, host_nation_kia, enemy_kia + friendly_kia + civilian_kia + host_nation_kia from diary;

-- ação com mais mortes
select friendly_kia, enemy_kia, civilian_kia, host_nation_kia, max(enemy_kia + friendly_kia + civilian_kia + host_nation_kia) from diary;

-- ações com mais mortes
select friendly_kia, enemy_kia, civilian_kia, host_nation_kia, enemy_kia + friendly_kia + civilian_kia + host_nation_kia as soma from diary order by soma desc limit 10;

-- total de mortes nas 10 ações com mais mortes, por tipo de morte
select sum(friendly_kia), sum(enemy_kia), sum(civilian_kia), sum(host_nation_kia), sum(total) from (select friendly_kia, enemy_kia, civilian_kia, host_nation_kia, enemy_kia + friendly_kia + civilian_kia + host_nation_kia as total from diary order by total desc limit 10);
