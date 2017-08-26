-- distribuição de aberturas por mês
select substr(data_abertura, 6, 2) as mes, count(*) from solicitacoes group by mes;
