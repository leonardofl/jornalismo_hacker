## Fonte dos dados

https://especiais.gazetadopovo.com.br/wp-content/uploads/sites/19/2019/08/05095845/atlas_da_violencia_2019_municipios.xlsx

Encontrado em

https://infograficos.gazetadopovo.com.br/seguranca-publica/atlas-da-violencia-2019-por-municipios/

## Importação dos dados

CREATE TABLE homicidios(
  uf TEXT,
  municipio TEXT,
  taxa REAL,
  homicidios INT,
  população INT
);


.separator ;
.headers on
.import 3-homicidios.csv homicidios

