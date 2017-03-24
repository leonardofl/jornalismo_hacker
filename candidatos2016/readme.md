# Candidatos das eleições municipais de 2016

Dados disponibilizados pelo TSE.

Tabelas:

    CREATE TABLE "despesas" ("sequencial_candidato" , "valor" REAL);
    CREATE TABLE "receitas" ("sequencial_candidato" , "valor" REAL);
    CREATE TABLE "candidatos" ("uf" , "cod_municipio" , "municipio" , "cargo" , "sequencial_candidato" , "nome" , "numero_partido", "sigla_partido" , "ocupacao" , "idade" , "sexo" , "grau_instrucao" , "estado_civil" , "cor" , "resultado" , total_despesas real, total_receitas real);

Exemplo de coisa que dá pra fazer com esses dados: https://infogr.am/open_data_day____mulheres_nas_eleicoes_2016

Base candidatos2016.sqlite (~0,5GB): https://www.dropbox.com/s/v3d084svni2c106/candidatos2016.sqlite?dl=0
