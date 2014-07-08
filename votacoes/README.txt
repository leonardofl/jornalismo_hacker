
Análise de votações da Câmara dos Deputados

== Objetivo ==

Agregar votos por partido, UF e por região.

Ou seja, desejamos saber quantos SIMs e quantos NÃOs cada partido* deu em uma votação.
* ou UF ou região.

== Método utilizado ==

Processamento de arquivos XMLs por programas escritos na linguagem Python.

== Fonte dos dados ==

codigo_florestal.xml:
http://www.camara.gov.br/SitCamaraWS/Proposicoes.asmx/ObterVotacaoProposicao?tipo=PL&numero=1876&ano=1999

fundo_social_pre_sal.xml:
http://www.camara.gov.br/SitCamaraWS/Proposicoes.asmx/ObterVotacaoProposicao?tipo=PL&numero=5940&ano=2009

Para saber mais sobre as proposições analisadas:
http://www.camara.gov.br/SitCamaraWS/Proposicoes.asmx/ObterProposicao?tipo=PL&numero=5940&ano=2009
http://www.camara.gov.br/SitCamaraWS/Proposicoes.asmx/ObterProposicao?tipo=PL&numero=1876&ano=1999

== Pontos importantes ==

Considerando que a Câmara possui mais de 500 deputados, fazer esse tipo de agregação de forma manual seria muito dispendioso, moroso e propenso a erros.

Mas o maior ganho ao automatizar a tarefa, é que uma vez que o programa está pronto, podemos realizar o mesmo tipo agregação para qualquer votação que seja disponibilizada no mesmo formato*!
* i.e. tenha a mesma estrutura

Ou seja, se acharmos o XML da votação de uma outra proposição, não precisamos criar um novo programa, o trabalho já está feito!

== XML ==

Um arquivo XML possui uma estrutura complexa, podendo apresentar dados organizados de forma hierárquica.

Embora possua um poder de representação mais rico que planilhas, o XML é também mais complicado de ser processado.

Por isso nesse caso não bastam simples comandos da linha de comando, e por isso estamos usando uma linguagem de programação de propósito geral e bem poderosa, a linguagem Python.

Links pra consultar:
http://pt.wikipedia.org/wiki/XML
http://pt.wikipedia.org/wiki/Python

== Executando ==

Na linha de comando digite:

$python agrupa_por_partido.py fundo_social_pre_sal.xml

No lugar de "agrupa_por_partido.py" você pode especificar um dos outros programas (terminados em .py).

No lugar de "fundo_social_pre_sal.xml" você pode especificar outro arquivo XML de votação que siga o mesmo formato.

Você pode também conferir o resultado de cada programa na pasta "saidas" deste repositório.

== Questão jornalística ==

Com base nos resultados obtidos, pode-se dizer que no caso das votações sobre o código florestal e do fundo social do pré sal há alguma influência da região do deputado em sua decisão de voto?
Ou a decisão de voto é predominantemente tomada de acordo com o partido do deputado?

== Desafio ==

Baixar os dados de votação de alguma outra proposição e executar os três programas python para essa nova proposição.

O acesso às votações de uma proposição é feito pela URL:
http://www.camara.gov.br/SitCamaraWS/Proposicoes.asmx/ObterVotacaoProposicao?tipo=<TIPO>&numero=<NUMERO>&ano=<ANO>,
onde <TIPO>, <NUMERO> e <ANO> devem ser substituídos por valores adequados.

Para saber quais proposições foram votadas em plenário, usar a URL:
http://www.camara.gov.br/SitCamaraWS/Proposicoes.asmx/ListarProposicoesVotadasEmPlenario?ano=2013&tipo=PL
(o tipo e ano podem ser variados)

Tipo de uma proposição é PL, PLC, PEC, MPV, etc...

Obs: uma proposição pode ter várias votações (diversas emendas, etc.)

Para conhecer mais sobre os dados abertos da Câmara do Deputados:
http://www2.camara.leg.br/transparencia/dados-abertos


