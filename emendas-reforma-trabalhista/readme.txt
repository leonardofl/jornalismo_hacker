Base de candiadatos: http://agencia.tse.jus.br/estatistica/sead/odsele/consulta_cand/consulta_cand_2016.zip

Procurando por Laura Carneiro na base de candidatos do TSE

cat candidatos.csv | grep -i laura | grep RJ
"RJ";"190000001463";"LAURA CARNEIRO";"PTB"
"RJ";"190000000181";"LAURA LUZIA";"PSL"
"RJ";"190000002189";"LAURA SCHOTT";"PSDC"

Vish, lá no site da Câmara, a Laura é do PMDB.

Vamos ver se conseguimos todos pelo nome.

cat candidatos.csv | grep -i "laura carneiro" 
"RJ";"190000001463";"LAURA CARNEIRO";"PTB"
OK

cat candidatos.csv | grep -i "Darcísio Perondi" 
cat candidatos.csv | grep -i "Perondi" 
"RS";"210000000164";"PERONDI";"PMDB"
Ferrou

Obter nomes dos emendadores: emendadores.txt 
Obtido no braço (copiando de http://www.camara.gov.br/proposicoesWeb/prop_emendas?idProposicao=2122076&subst=0):

./look-id.sh > emendadores-com-id.csv

emendadores-com-id.csv possui os nomes dos emendadores e os ID do emendador na tabela de doações eleitorais (segunda coluna). Utilizaremos esse ID para encontrar as doações em http://agencia.tse.jus.br/estatistica/sead/odsele/prestacao_contas/prestacao_contas_final_2014.zip (link inválido, tem que descubrir onde está o arquivo. Eu já o de 2016 aqui: http://agencia.tse.jus.br/estatistica/sead/odsele/prestacao_contas/prestacao_contas_final_2016.zip).

MAS... o arquivo emendadores-com-id.csv procura deixar claro nomes de emendadores para os quais não foi encontrado candidato na tabela do TSE, ou nome que bateu com mais de um candidato. Cabe agora aqui uma aferição manual.





