#!/bin/bash
#Transforma idh.html em CSV
#Obs: isso pode também ser feito com o recurso "replace all" de qualquer editor de texto!
cat idh.html | sed  -e 's:</td><td>:; :g' -e 's:<tr><td>::' -e 's:</td></tr>::'

