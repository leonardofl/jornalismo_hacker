
-- Se familizarizando com a base
select count(*) from pedidos; -- 18120
select min(dt_abertura_pedido), max(dt_abertura_pedido) from pedidos; -- "2012-08-23","2017-07-05"
select count(*) from atendimentos; -- 35056
select min(dt_resposta_atendimento), max(dt_resposta_atendimento) from atendimentos; -- "2016-01-01","2017-06-30"

-- Histograma de quantidade de atendimentos por pedido
select qtd_atendimentos_por_pedido, count(*) as ocorrencias_qtd_atendimentos from
    (select pedido, count(*) as qtd_atendimentos_por_pedido from
        (select a.cd_pedido as pedido, a.cd_atendimento_pedido as atendimento from atendimentos a, pedidos p 
        where a.cd_pedido = p.cd_pedido)
    group by pedido)
group by qtd_atendimentos_por_pedido 
order by ocorrencias_qtd_atendimentos desc;
-- "3","4996"
-- "6","1103"
-- "4","849"
-- "5","461"
-- "1","336"
-- "2","326"
-- "7","287"
-- "8","229"
-- "9","174"
-- "10","46"
-- "11","33"
-- "12","26"
-- "13","9"
-- "14","4"
-- "15","2"
-- "16","1"

-- Achando pedidos com 6 atendimentos
select pedido, count(*) as qtd_atendimentos from
    (select a.cd_pedido as pedido, a.cd_atendimento_pedido as atendimento from atendimentos a, pedidos p 
    where a.cd_pedido = p.cd_pedido)
group by pedido having qtd_atendimentos = 6;

-- Um deles é o 14228. Vamos analisá-lo.
select p.cd_pedido, p.nome_orgao, p.cd_solicitante, p.dt_abertura_pedido, 
       a.cd_atendimento_pedido, a.nome_status, a.dt_resposta_atendimento 
from atendimentos a, pedidos p 
where a.cd_pedido = p.cd_pedido and p.cd_pedido = 14228
order by a.dt_resposta_atendimento;

-- Descobrindo status de indeferimento 
select distinct cd_status_atendimento_pedido, nome_status from atendimentos;
select distinct cd_status_atendimento_pedido, nome_status from atendimentos where nome_status like '%indef%';
-- "4","Pedido indeferido"
-- "36","2ª instância indeferida"
-- "19","Encaminhamento Indeferido"
-- "32","1ª instância indeferida"
-- "42","3ª instância indeferida"

-- Órgãos com mais pedidos indeferidos (top 10)
select p.nome_orgao, count(*) as qtd_indeferimentos
from atendimentos a, pedidos p 
where a.cd_pedido = p.cd_pedido and cd_status_atendimento_pedido in (4, 36, 19, 32, 42)
group by p.cd_orgao
order by qtd_indeferimentos desc limit 10;
-- "SF - Secretaria Municipal da Fazenda","197"
-- "SMS - Secretaria Municipal da Saúde","149"
-- "SMT - Secretaria Municipal de Mobilidade e Transportes","117"
-- "CET - Companhia de Engenharia de Tráfego","110"
-- "SMG - Secretaria Municipal de Gestão","88"
-- "SPTrans - São Paulo Transportes S/A","63"
-- "SME - Secretaria Municipal de Educação","61"
-- "COHAB - Companhia Metropolitana de Habitação","59"
-- "PGM - Procuradoria Geral do Município","55"
-- "CGM - Controladoria Geral do Município","54"



