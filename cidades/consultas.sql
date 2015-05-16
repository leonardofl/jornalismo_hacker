
select paises.Nome, linguas.nome from paises, linguas, pais_lingua
where paises.id=pais_lingua.idpais and linguas.id=pais_lingua.idlingua;

select linguas.nome as Lingua, cidades.nome as Cidade, paises.Nome as Pais from cidades, paises, linguas, pais_lingua
where paises.id=pais_lingua.idpais and linguas.id=pais_lingua.idlingua and cidades.idPais=paises.id
order by linguas.falantes desc, paises.populacao desc, cidades.populacao desc;
