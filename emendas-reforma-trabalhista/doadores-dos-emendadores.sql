SELECT e.emenda, e.autor, ec.sequencial_candidato, r.valor, r.nome_doador, r.identificacao_doador 
FROM emendas e, emendador_candidato ec, receitas_consolidadas r
WHERE e.autor = ec.nome_emendador and ec.sequencial_candidato = r.sequencial_candidato;
