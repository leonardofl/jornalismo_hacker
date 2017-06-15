while read e; do
    echo "$e >"
    command="grep -i '$e' candidatos2014.csv"
    eval $command   
done <emendadores.txt
