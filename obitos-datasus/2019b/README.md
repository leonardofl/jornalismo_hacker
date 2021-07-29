## Origem dados

https://www.dropbox.com/s/sr2uhl06hbqc8zs/dados2019_limpos.zip?dl=1

CSV baixado da lib microdatasus do R.

## Importação para Sqlite

```sql
  sqlite3 obitos.sqlite

  .separator ,
  .import cid10.csv cid
  .import dados2019_limpos.csv obitos2019
```



