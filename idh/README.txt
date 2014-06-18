
== Objetivo ==

Obter lista de IDH dos municípios de um determinado estado.


== Dados disponíveis ==

Lista de IDH dos municípios brasileiros

http://www.pnud.org.br/atlas/ranking/Ranking-IDHM-Municipios-2010.aspx


== Passos ==

Baixar o html orignial (original.html)
Edição manual pra deixar no html só as linhas com dados (idh.html)
Transformar o html em csv (html_to_csv.sh -> idh.csv)
Obter lista por estado (idh_por_estado.sh -> idh_sp.csv)
Para saber a posição de um município em seu estado, basta ver em que linha o município está usando um editor de texto
Obter lista limpa dos top 10 de um estado (top10.sh)


== Conclusões interessantes ==

1) Os top 10 no estado de SP:

 São Caetano do Sul 
 Águas de São Pedro 
 Santos 
 Jundiaí 
 Valinhos 
 Vinhedo 
 Santo André 
 Araraquara 
 Santana de Parnaíba 
 Ilha Solteira

2) O município de São Paulo está 14o lugar no raking de IDH do estado de SP.


