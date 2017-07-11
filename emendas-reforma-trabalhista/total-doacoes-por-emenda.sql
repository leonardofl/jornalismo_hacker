SELECT e.*, ec.sequencial_candidato, r.soma
FROM emendas e, emendador_candidato ec, (SELECT sequencial_candidato, sum(valor) as soma FROM receitas_consolidadas
GROUP BY sequencial_candidato) r
WHERE ec.nome_emendador = e.autor and ec.sequencial_candidato = r.sequencial_candidato;
