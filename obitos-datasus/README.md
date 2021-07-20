Dados em https://www.dropbox.com/s/kz7t8z0dtf28l67/obitos_datasus.zip?dl=0

## Importação

```sql
sqlite3 obitos.sqlite

.separator ,
.import cid10.csv cid
.import obitos2000.csv obitos2000
.import obitos2019.csv obitos2019

-- melhora formato de DTOBITO: ddmmaaaa -> aaaa-mm-dd
update obitos2000 set DTOBITO = substr(DTOBITO, 5, 4) || '-' || substr(DTOBITO, 3, 2) || '-' || substr(DTOBITO, 1, 2);
```
