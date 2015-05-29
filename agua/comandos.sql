
create view maiores as select * from contratos where vol2014 != "" AND vol2013 != "" order by vol2014 desc limit 50;

create view shoppings as select * from contratos where vol2014 != "" AND vol2013 != "" AND cliente like "%shopping%";

create view shopping_oculto as select * from contratos where (vol2014 = "" OR vol2013 = "") AND cliente like "%shopping%";

create view igrejas as select cliente from contratos where cliente like "%igreja%";

-- analisa variação no consumo de água de 2013 para 2014 de alguns segmentos

select cliente, vol2014, (vol2014 - vol2013) as dif, round (((vol2014 - vol2013) * 1.0 /vol2013), 4) * 100 as percentual from maiores order by percentual desc;

select cliente, vol2014, (vol2014 - vol2013) as dif, round (((vol2014 - vol2013) * 1.0 /vol2013), 4) * 100 as percentual from shoppings order by percentual desc;

select cliente, vol2014, (vol2014 - vol2013) as dif, round (((vol2014 - vol2013) * 1.0 /vol2013), 4) * 100 as percentual from igrejas order by percentual desc;
