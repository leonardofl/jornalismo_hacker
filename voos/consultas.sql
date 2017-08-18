
-- empresas aéreas em nossa base
select distinct unique_carrier from flights;
select count(distinct unique_carrier) from flights;
select distinct c.description from flights v, carriers c where v.unique_carrier = c.code;

-- destino mais popular
select dest_city_name, count(*) as qtd from flights group by dest_city_name order by qtd desc;
select dest_city_name, count(*) as qtd from flights group by dest_city_name order by qtd desc limit 10;

-- voos por ano
select substr(fl_date,1,4) from flights limit 5;
select distinct substr(fl_date,1,4) from flights;
select substr(fl_date,1,4) as ano, count(*) as qtd from flights group by ano order by ano;

-- voos por mês
select substr(fl_date,6,2) as mes, count(*) as qtd from flights group by mes order by qtd desc;

-- voos por mês/ano
select substr(fl_date,1,7) as anomes, count(*) as qtd from flights group by anomes order by anomes;

-- aeroportos mais movimentados
select distinct origin from flights;
select count(distinct origin) from flights;
select origin, count(*) as qtd from flights group by origin order by qtd desc;
select dest, count(*) as qtd from flights group by dest order by qtd desc;
create temp view partidas as select origin, count(*) as qtd from flights group by origin;
create temp view chegadas as select dest, count(*) as qtd from flights group by dest;
select p.origin, p.qtd as partidas, c.qtd as chegadas from partidas p, chegadas c where p.origin = c.dest;
select p.origin, p.qtd + c.qtd as movimento from partidas p, chegadas c where p.origin = c.dest order by movimento desc limit 10;
select p.origin, p.qtd + c.qtd as movimento, p.qtd as partidas, c.qtd from partidas p, chegadas c where p.origin = c.dest order by movimento desc limit 10;
select p.origin, a.description, p.qtd + c.qtd as movimento, p.qtd as partidas, c.qtd from partidas p, chegadas c, airports a where p.origin = c.dest and c.dest = a.code order by movimento desc limit 10;

-- compahias aéreas mais populares
select distinct unique_carrier from flights;
select unique_carrier, count(*) as qtd from flights group by unique_carrier order by qtd desc;
select c.description, count(*) as qtd from flights v, carriers c where v.unique_carrier = c.code group by v.unique_carrier order by qtd desc;

-- rota mais popular
select origin, dest, count(*) as qtd from flights group by origin, dest order by qtd desc limit 10;
select a_ori.description, a_des.description, count(*) as qtd from flights v, airports a_ori, airports a_des where v.origin = a_ori.code and v.dest = a_des.code group by origin, dest order by qtd desc limit 10;

-- flights mais longos

-- tentar usar
--    Having
--    Sub select
--    Contas entre colunas
--    Views
