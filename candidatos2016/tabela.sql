--
-- quantidades e despesas por sexo por cargo e uf
--

.headers on
.mode csv
.separator ;

SELECT uf, cargo, 1.0*qtd_feminino/(qtd_feminino+qtd_masculino) AS porcentagem_qtd_feminino,
              1.0*despesas_feminino/(despesas_feminino+despesas_masculino) AS porcentagem_despesas_feminino,
              1.0*qtd_feminino_eleito/(qtd_feminino_eleito+qtd_masculino_eleito) AS porcentagem_qtd_feminino_eleito,
              1.0*despesas_feminino_eleito/(despesas_feminino_eleito+despesas_masculino_eleito) AS porcentagem_despesas_feminino_eleito
FROM (SELECT uf, cargo,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'FEMININO' and c2.cargo = c1.cargo and c2.uf = c1.uf) as qtd_feminino,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and c2.cargo = c1.cargo and c2.uf = c1.uf) as qtd_masculino,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'FEMININO' and c2.cargo = c1.cargo and c2.uf = c1.uf) as despesas_feminino,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and c2.cargo = c1.cargo and c2.uf = c1.uf) as despesas_masculino,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'FEMININO' and resultado = 'ELEITO' and c2.cargo = c1.cargo and c2.uf = c1.uf) as qtd_feminino_eleito,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and resultado = 'ELEITO' and c2.cargo = c1.cargo and c2.uf = c1.uf) as qtd_masculino_eleito,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'FEMININO' and resultado = 'ELEITO' and c2.cargo = c1.cargo and c2.uf = c1.uf) as despesas_feminino_eleito,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and resultado = 'ELEITO' and c2.cargo = c1.cargo and c2.uf = c1.uf) as despesas_masculino_eleito
FROM candidatos c1 WHERE cargo != 'VICE-PREFEITO' GROUP BY uf, cargo)

UNION

SELECT uf, 'TOTAL', 1.0*qtd_feminino/(qtd_feminino+qtd_masculino) AS porcentagem_qtd_feminino,
                1.0*despesas_feminino/(despesas_feminino+despesas_masculino) AS porcentagem_despesas_feminino,
                1.0*qtd_feminino_eleito/(qtd_feminino_eleito+qtd_masculino_eleito) AS porcentagem_qtd_feminino_eleito,
                1.0*despesas_feminino_eleito/(despesas_feminino_eleito+despesas_masculino_eleito) AS porcentagem_despesas_feminino_eleito
FROM (SELECT uf,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'FEMININO' and c2.uf = c1.uf) as qtd_feminino,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and c2.uf = c1.uf) as qtd_masculino,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'FEMININO' and c2.uf = c1.uf) as despesas_feminino,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and c2.uf = c1.uf) as despesas_masculino,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'FEMININO' and resultado = 'ELEITO' and c2.uf = c1.uf) as qtd_feminino_eleito,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and resultado = 'ELEITO' and c2.uf = c1.uf) as qtd_masculino_eleito,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'FEMININO' and resultado = 'ELEITO' and c2.uf = c1.uf) as despesas_feminino_eleito,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and resultado = 'ELEITO' and c2.uf = c1.uf) as despesas_masculino_eleito
FROM candidatos c1 WHERE cargo != 'VICE-PREFEITO' GROUP BY uf)

UNION

SELECT 'BRASIL', cargo, 1.0*qtd_feminino/(qtd_feminino+qtd_masculino) AS porcentagem_qtd_feminino,
                1.0*despesas_feminino/(despesas_feminino+despesas_masculino) AS porcentagem_despesas_feminino,
                1.0*qtd_feminino_eleito/(qtd_feminino_eleito+qtd_masculino_eleito) AS porcentagem_qtd_feminino_eleito,
                1.0*despesas_feminino_eleito/(despesas_feminino_eleito+despesas_masculino_eleito) AS porcentagem_despesas_feminino_eleito
FROM (SELECT cargo,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'FEMININO' and c2.cargo = c1.cargo) as qtd_feminino,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and c2.cargo = c1.cargo) as qtd_masculino,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'FEMININO' and c2.cargo = c1.cargo) as despesas_feminino,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and c2.cargo = c1.cargo) as despesas_masculino,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'FEMININO' and resultado = 'ELEITO' and c2.cargo = c1.cargo) as qtd_feminino_eleito,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and resultado = 'ELEITO' and c2.cargo = c1.cargo) as qtd_masculino_eleito,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'FEMININO' and resultado = 'ELEITO' and c2.cargo = c1.cargo) as despesas_feminino_eleito,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and resultado = 'ELEITO' and c2.cargo = c1.cargo) as despesas_masculino_eleito
FROM candidatos c1 WHERE cargo != 'VICE-PREFEITO' GROUP BY cargo)

UNION

SELECT 'BRASIL', 'TOTAL', 1.0*qtd_feminino/(qtd_feminino+qtd_masculino) AS porcentagem_qtd_feminino,
                1.0*despesas_feminino/(despesas_feminino+despesas_masculino) AS porcentagem_despesas_feminino,
                1.0*qtd_feminino_eleito/(qtd_feminino_eleito+qtd_masculino_eleito) AS porcentagem_qtd_feminino_eleito,
                1.0*despesas_feminino_eleito/(despesas_feminino_eleito+despesas_masculino_eleito) AS porcentagem_despesas_feminino_eleito
FROM (SELECT
	(select count(*) from candidatos c2 WHERE c2.sexo = 'FEMININO' and cargo != 'VICE-PREFEITO') as qtd_feminino,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and cargo != 'VICE-PREFEITO') as qtd_masculino,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'FEMININO' and cargo != 'VICE-PREFEITO') as despesas_feminino,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and cargo != 'VICE-PREFEITO') as despesas_masculino,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'FEMININO' and resultado = 'ELEITO' and cargo != 'VICE-PREFEITO') as qtd_feminino_eleito,
	(select count(*) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and resultado = 'ELEITO' and cargo != 'VICE-PREFEITO') as qtd_masculino_eleito,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'FEMININO' and resultado = 'ELEITO' and cargo != 'VICE-PREFEITO') as despesas_feminino_eleito,
	(select sum(total_despesas) from candidatos c2 WHERE c2.sexo = 'MASCULINO' and resultado = 'ELEITO' and cargo != 'VICE-PREFEITO') as despesas_masculino_eleito
);
