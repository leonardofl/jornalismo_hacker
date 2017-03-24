
-- Total de despesas no Amapá
select sum(total_despesas) from candidatos where uf = 'AP';

-- Total de despesas das candidatas no Amapá
select sum(total_despesas) from candidatos where uf = 'AP' and sexo = 'FEMININO';

-- Porcentagem das despesas relativa às candidatas no Amapá
select 1.0*despesas_feminino/(todas_despesas) as porcentagem_despesas_feminino from (select
    (select sum(total_despesas) from candidatos where uf = 'AP' and sexo = 'FEMININO') as despesas_feminino,
    (select sum(total_despesas) from candidatos where uf = 'AP') as todas_despesas
);

-- Total de despesas dos candidatos a prefeito no Amapá
select sum(total_despesas) from candidatos where uf = 'AP' and cargo = 'PREFEITO';

-- Total de despesas das candidatas mulheres a prefeito no Amapá
select sum(total_despesas) from candidatos where uf = 'AP'  and cargo = 'PREFEITO' and sexo = 'FEMININO';
