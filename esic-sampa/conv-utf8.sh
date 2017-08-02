#!/bin/bash
mkdir utf8
for f in *.csv
do
    echo "Processing $f"
    iconv -f ISO-8859-15 -t UTF-8 $f > utf8/$f
done
