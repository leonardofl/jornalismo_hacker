
-- consultas para o banco votacoes contendo votações de apenas uma proposição

-- vendo todos os registros
SELECT * FROM votacoes;

-- quantos registros temos (cada registro é o voto de um parlamentar em uma votação)
SELECT count(*) FROM votacoes;

-- quais foram as votações (pra uma proposição podemos ter 1 ou mais votações)
SELECT distinct votacao, proposicao FROM votacoes;

-- vamos estudar uma votação em específico
SELECT * FROM votacoes WHERE votacao = "2290";

-- quantos votos temos nessa votação
SELECT count(*) FROM votacoes WHERE votacao = "2290";

-- pra sacar a polarização entre SIM e NAO dessa votação vamos ver os votos do PT...
SELECT parlamentar_nome, uf, voto FROM votacoes WHERE votacao = "2290" and partido = "PT";

-- ... e também do PSDB
SELECT parlamentar_nome, partido, uf, voto FROM votacoes WHERE votacao = "2290" and (partido = "PT" or partido = "PSDB");
-- mas assim tá meio bagunçado pra ver

-- melhor ordernar a saída por partido
SELECT parlamentar_nome, partido, uf, voto FROM votacoes WHERE votacao = "2290" and (partido = "PT" or partido = "PSDB") order by partido;

-- ah, um jeito mais legal de se fazer a mesma consulta
SELECT parlamentar_nome, partido, uf, voto FROM votacoes WHERE votacao = "2290" and partido in ("PT", "PSDB") order by partido;

-- vamos ver agora os votos de alguns parlamentares em específico, mais por curiosidade
SELECT parlamentar_nome, partido, uf, voto FROM votacoes WHERE votacao = "2290" and parlamentar_nome = "Tiririca";

SELECT parlamentar_nome, partido, uf, voto FROM votacoes WHERE votacao = "2290" and parlamentar_nome = "Romário";

SELECT parlamentar_nome, partido, uf, voto FROM votacoes WHERE votacao = "2290" and parlamentar_nome = "Bolsonaro";
-- opa, não achou o Bolsonaro... talvez o registro tenha o seu nome completo, e não apenas "Bolsonaro"

-- vamos dizer que esquecemos o primeiro nome do Bolsonaro
-- nesse caso, o parlamentar_nome que procuramos não é exatamente "Bolsonaro"
-- podemos dizer que queremos ** algo como "<alguma coisa> Bolsonaro" **
SELECT parlamentar_nome, partido, uf, voto FROM votacoes WHERE votacao = "2290" and parlamentar_nome like "%Bolsonaro";

-- partidos que votaram nessa votação
SELECT distinct partido FROM votacoes WHERE votacao = "2290";

-- quantos votos cada partido deu
SELECT count(*) FROM votacoes WHERE votacao = "2290" GROUP BY partido;
-- ops, só apareceram números, assim não dá pra entender

-- agora sim, mostra partido e a quantidade de votos do partido
SELECT partido, count(*) FROM votacoes WHERE votacao = "2290" GROUP BY partido;

-- pra deixar a saída anterior mais interessante vamos ordena-la por quantidade de votos
SELECT partido, count(*) as qtd FROM votacoes WHERE votacao = "2290" GROUP BY partido ORDER BY qtd DESC;

-- finalmente o que interessa: a distribuição de votos por partido
SELECT partido, voto, count(*) as qtd FROM votacoes WHERE votacao = "2290" GROUP BY partido, voto ORDER BY partido, qtd;

-- e agora a distribuição de votos por região 
SELECT regiao, voto, count(*) as qtd FROM votacoes WHERE votacao = "2290" GROUP BY regiao, voto ORDER BY regiao, qtd;

-- se quisermos ver de uma vez a distribuição de votos por região de todas as votações de nossa proposição analisada
SELECT votacao, regiao, voto, count(*) as qtd FROM votacoes WHERE proposicao = "PL 1876/1999" GROUP BY votacao, regiao, voto ORDER BY votacao, regiao, qtd;

-- para visualizar melhor podemos fazer uns gráficos

--------------------------------------------
-- analisando agora a emenda 24 dp PL 7/2010 
-- (obriga a União a compensar os estados e municípios produtores pelas perdas na arrecadação de royalties)

-- distribuição de votos
SELECT voto, count(*) as qtd FROM votacoes WHERE votacao = "606" GROUP BY voto;

-- distribuição por UF
SELECT uf, voto, count(*) as qtd FROM votacoes WHERE votacao = "606" GROUP BY uf, voto ORDER BY uf;
-- ES e RJ votarão não! Não esperado.

-- Vamos ver os partidos do ES e do RJ
SELECT uf, partido as qtd FROM votacoes WHERE votacao = "606" and (uf = "RJ" OR uf = "ES") ORDER BY uf;

-- Vamos ver agora a distribuição de votos só desses partidos
SELECT partido, voto, count(*) as qtd FROM votacoes WHERE votacao = "2290" and partido in ("PSB", "PR", "PMDB", "PRB", "PP") GROUP BY partido, voto ORDER BY partido, qtd;






