head "167092323_T_ONTIME(0).csv" -n 1 > header.txt
cat *csv | sed '/ORIGIN_AIRPORT_ID/d' > voos.csv
split --lines=1700000 --additional-suffix=.csv voos.csv voos
# manualmente acrestar o conteúdo de header.txt no início de voosaa.csv
# depois criei índices para fl_date
