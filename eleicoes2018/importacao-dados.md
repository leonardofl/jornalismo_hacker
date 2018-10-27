
# Importação de detalhe_votacao_munzona_2018

## Escolhendo quais campos farão parte da base

Os marcados com "*" são os escolhidos

        DT_GERACAO
        HH_GERACAO
        ANO_ELEICAO
        CD_TIPO_ELEICAO
        NM_TIPO_ELEICAO
        NR_TURNO
        CD_ELEICAO
        DS_ELEICAO
        DT_ELEICAO
        TP_ABRANGENCIA
        * SG_UF
        SG_UE
        NM_UE
        * CD_MUNICIPIO
        * NM_MUNICIPIO
        * NR_ZONA
        * CD_CARGO
        * DS_CARGO
        * QT_APTOS
        QT_SECOES
        QT_SECOES_AGREGADAS
        * QT_APTOS_TOT
        QT_SECOES_TOT
        * QT_COMPARECIMENTO
        * QT_ABSTENCOES
        * ST_VOTO_EM_TRANSITO
        * QT_VOTOS_NOMINAIS
        * QT_VOTOS_BRANCOS
        * QT_VOTOS_NULOS
        * QT_VOTOS_LEGENDA
        * QT_VOTOS_PENDENTES
        * QT_VOTOS_ANULADOS
        HH_ULTIMA_TOTALIZACAO
        DT_ULTIMA_TOTALIZACAO


## Gerando a base

./zonas_2018_to_csv.sh

sqlite3 zonas-eleitorais-primeiro-turno-2018.sqlite

CREATE TABLE zonas2018 (
    SG_UF,
    CD_MUNICIPIO INTEGER,
    NM_MUNICIPIO,
    NR_ZONA INTEGER,
    CD_CARGO INTEGER,
    DS_CARGO,
    QT_APTOS INTEGER,
    QT_APTOS_TOT INTEGER,
    QT_COMPARECIMENTO INTEGER,
    QT_ABSTENCOES INTEGER,
    ST_VOTO_EM_TRANSITO,
    QT_VOTOS_NOMINAIS INTEGER,
    QT_VOTOS_BRANCOS INTEGER,
    QT_VOTOS_NULOS INTEGER,
    QT_VOTOS_LEGENDA INTEGER,
    QT_VOTOS_PENDENTES INTEGER,
    QT_VOTOS_ANULADOS INTEGER
);

.separator ;
.import zonas2018.csv zonas2018


