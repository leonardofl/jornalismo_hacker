#!/bin/bash
#Transforma idh.html em CSV
cat idh.html | sed  -e 's/<\/td><td>/; /g' -e 's/<tr><td>//' -e 's/<\/td><\/tr>//'

