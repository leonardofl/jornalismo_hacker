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

./look-id.sh >  emendadores-com-ids.txt

emendadores-com-ids.txt possui os nomes dos emendadores e os ID do emendador na tabela de doações eleitorais (segunda coluna). Utilizaremos esse ID para encontrar as doações em http://agencia.tse.jus.br/estatistica/sead/odsele/prestacao_contas/prestacao_contas_final_2014.zip (link inválido, tem que descubrir onde está o arquivo. Eu já o de 2016 aqui: http://agencia.tse.jus.br/estatistica/sead/odsele/prestacao_contas/prestacao_contas_final_2016.zip).

MAS... o arquivo emendadores-com-ids.txt procura deixar claro nomes de emendadores para os quais não foi encontrado candidato na tabela do TSE, ou nome que bateu com mais de um candidato. Cabe agora aqui uma aferição manual.

Próximo passo: 
cp emendadores-com-ids.txt emendadores-com-ids-desambiguizado.txt
Varrer o arquivo emendadores-com-ids-desambiguizado.txt e:
1) Para emendadores sem registro de candidato, procurar o candidato correspondente no arquivo candidatos2014.csv. Pode ser que ele não tenha sido encontrado pois o candidato está apenas com o sobre-nome, ou o nome esteja com acentuação diferente do site das emendas.
2) Para emendadores com mais de um registro de candidato encontrado, desambiguizar. Para isso, conferir UF e partido na página das emendas. Lembrando que o deputado pode ter trocado de partido.
 
Não consegui achar o emendador Paulo Pereira da Silva na lista de candidatos. Suplente talvez?

Abre emendadores-com-ids-desambiguizado.txt no gedit, faz replace de " > *\n" por ";" e salva como emendadores-com-ids-desambiguizados.csv.
Coloca o header: "nome-emendador;uf-candidato;id-candidato;nome-candidato;partido-candidato".



