
Importar pelos SQLite Manager deu o seguinte erro:

    CSV Worker error!
    allocation size overflow
    File name: chrome://sqlitemanager/content/workerCsv.js
    Line number: 21

Tentando pela linha de comando:

    CREATE TABLE solicitacoes (
        data_abertura text, 
        hora_abertura text,
        prefeitura_regional text,
        distrito text,
        orgao text,
        tema text,
        assunto text,
        servico text,
        status_solicitacao text,
        data_parecer text,
        hora_parecer text 
    );

    .separator ;
    .import sp156.csv solicitacoes

OK ;)
