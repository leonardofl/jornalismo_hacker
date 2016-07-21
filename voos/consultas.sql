
-- destino mais popular
select dest_city_name, count(*) as qtd from voos group by dest_city_name order by qtd desc;
select dest_city_name, count(*) as qtd from voos group by dest_city_name order by qtd desc limit 10;

-- voos por ano

-- voos por mês
select substr(fl_date,6,2) from voos limit 5;
select distinct substr(fl_date,6,2) from voos;
select substr(fl_date,6,2) as mes, count(*) as qtd from voos group by mes order by qtd desc;

-- aeroportos mais movimentados
select distinct origin from voos;
select count(distinct origin) from voos;
select origin, count(*) as qtd from voos group by origin order by qtd desc;
select dest, count(*) as qtd from voos group by dest order by qtd desc;
create temp view partidas as select origin, count(*) as qtd from voos group by origin;
create temp view chegadas as select dest, count(*) as qtd from voos group by dest;
select p.origin, p.qtd as partidas, c.qtd as chegadas from partidas p, chegadas c where p.origin = c.dest; 
select p.origin, p.qtd + c.qtd as movimento from partidas p, chegadas c where p.origin = c.dest order by movimento desc limit 10; 
select p.origin, p.qtd + c.qtd as movimento, p.qtd as partidas, c.qtd from partidas p, chegadas c where p.origin = c.dest order by movimento desc limit 10; 

-- compahias aéreas mais populares

-- voos mais longos

-- tentar usar
--    Having
--    Sub select
--    Contas entre colunas
--    Views


