Base de candiadatos: http://agencia.tse.jus.br/estatistica/sead/odsele/consulta_cand/consulta_cand_2016.zip

Arquivo candidatos2014.csv gerado com o script gera-candidadtos-csv.sh

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

emendadores-com-ids.txt possui os nomes dos emendadores e os ID do emendador na tabela de doações eleitorais (segunda coluna). Utilizaremos esse ID para encontrar as doações em http://agencia.tse.jus.br/estatistica/sead/odsele/prestacao_contas/prestacao_final_2014.zip.

MAS... o arquivo emendadores-com-ids.txt procura deixar claro nomes de emendadores para os quais não foi encontrado candidato na tabela do TSE, ou nome que bateu com mais de um candidato. Cabe agora aqui uma aferição manual.

Próximo passo:
cp emendadores-com-ids.txt emendadores-com-ids-desambiguizado.txt
Varrer o arquivo emendadores-com-ids-desambiguizado.txt e:
1) Para emendadores sem registro de candidato, procurar o candidato correspondente no arquivo candidatos2014.csv. Pode ser que ele não tenha sido encontrado pois o candidato está apenas com o sobre-nome, ou o nome esteja com acentuação diferente do site das emendas.
2) Para emendadores com mais de um registro de candidato encontrado, desambiguizar. Para isso, conferir UF e partido na página das emendas. Lembrando que o deputado pode ter trocado de partido.

Não consegui achar o emendador Paulo Pereira da Silva na lista de candidatos.
Mas segundo a Cecília, é o Paulinho da Força!
Aí o comando "cat candidatos2014.csv | grep -i Força" achou nosso deputado.

Abre emendadores-com-ids-desambiguizado.txt no gedit, faz replace de " > *\n" por ";" e salva como emendadores-com-ids-desambiguizados.csv.
Coloca o header: "nome-emendador;uf-candidato;id-candidato;nome-candidato;partido-candidato".

Planilha emendas.ods gerada a partir de http://www.camara.gov.br/proposicoesWeb/prop_emendas?idProposicao=2122076&subst=0.
Foi feito um copy/paste do navegador para o Calc. Na verdade, colar tudo de uma vez dava pau, então foram feitos vários copy/pastes.
A partir do emendas.ods, gera-se o emendas.csv, contendo apenas as colunas "Emenda" e "Autor".

Arquivo receitas2014.csv gerado com script gera-receitas-csv.sh.
Arquivo receitas2014.csv não versionado por ser muito grande.

Criando o banco emendas-reforma-trabalhista.sqlite:
Importar os csvs candidatos2014, receitas2014, emendas2014 como tabelas no banco de dados.
Importar as colunas nome-emendador e id-candidato do arquivo emendadores-com-ids-desambiguizado.csv como a tabela emendador_candidato. Chamar a coluna id-candidato de sequencial_candidato.
Criar a estrutura da tabela receitas_consolidadas.
Executar povoar_receitas_consolidadas.py.

Na hora de importar receitas2014.csv obtive o seguinte erro:
Failed to import 34 lines.
Row numbers:37285, 38098, 38313, 38341, 38382, 85172, 88834, 95763, 95772, 95774, 98813, 292520, 303390, 305678, 306585, 306698, 315633, 326487, 368289, 430856, 432694, 432782, 489126, 489135, 489137, 489339, 526957, 694122, 780159, 780908, 822665, 842697, 843029, 843053
Nessas linhas tava faltando umas aspas no final.
Pra corrigir isso:
  cp receitas2014.csv receitas2014-faltando-aspas.csv
  sed -i 's/\([^"]\)$/\1"/' receitas2014.csv
  remover manualmente a aspa no fim da primeira linha (header)

Aí então foi esse o erro:
Failed to import 8 lines.
Row numbers:95770, 95779, 95781, 98820, 489144, 489153, 489155, 489357
Aspas dentro de aspas era o problema.
Mais especificamente, o problema era com o doador <<ELEIÇÃO 2014 RODRIGO SOBRAL ROLLEMBERG "40" GOVERNADOR>>
Pra resolver:
  sed -i 's/"40"/40/' receitas2014.csv

Aí agora sim deu certo a importação da tabelas receitas!
Lembre-se que coluna valor_receita deve ser do tipo REAL.

CREATE TABLE receitas_consolidadas (sequencial_candidato, identificacao_doador, nome_doador, valor REAL);

Para executar povoar_receitas_consolidadas.py:
  python povoar_receitas_consolidadas.py > povoar_receitas_consolidadas.sql
  cat povoar_receitas_consolidadas.sql | sqlite3 /path/to/emendas-reforma-trabalhista.sqlite

Por fim, o que queremos em doadores-dos-emendadores.sql

Observação sobre a metodologia de povoar_receitas_consolidadas.py:
Se há um doador originário, trabalhemos com ele. Caso contrário, utilizamos o doador não-originário.

Arquivos candidatos2014.csv, emendas-reforma-trabalhista.sqlite e doadores-dos-emendadores.csv disponíveis em:
https://drive.google.com/open?id=0B1JCC5LWFZb1dWRrSUpYbi12UFk
