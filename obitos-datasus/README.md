## Origem dados

Baixando os Dados (em R):

```R
    install.packages("devtools")
    devtools::install_github("rfsaldanha/microdatasus")
    library(microdatasus)

    setwd("~/Projetos/datasus")

    dados <- fetch_datasus(year_start = 2000, year_end = 2000, uf = "all", information_system = "SIM-DO")
    dados <- process_sim(dados)

    dados19 <- fetch_datasus(year_start = 2019, year_end = 2019, uf = "all", information_system = "SIM-DO")
    dados19 <- process_sim(dados)

    write.csv(dados,'obitos2000.csv')
    write.csv(dados19,'obitos2019.csv')
```

Pode baixar os CSVs também de https://www.dropbox.com/s/kz7t8z0dtf28l67/obitos_datasus.zip?dl=0

## Importação para Sqlite


```sql
  sqlite3 obitos.sqlite

  .separator ,
  .import cid10.csv cid
  .import obitos2000.csv obitos2000
  .import obitos2019.csv obitos2019

  -- melhora formato de DTOBITO: ddmmaaaa -> aaaa-mm-dd
  update obitos2000 set DTOBITO = substr(DTOBITO, 5, 4) || '-' || substr(DTOBITO, 3, 2) || '-' || substr(DTOBITO, 1, 2);
```
