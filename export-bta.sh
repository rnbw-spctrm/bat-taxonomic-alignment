#!/bin/bash
#
#

exportTSV() {
 preston cat hash://sha256/26d368c772f240d65645248caa56dabae5cb2414ac57e8f0438d4c3dcf62e377\
 | tail -n+2
} 

exportTSV\
 > bta.tsv
 
exportTSV\
 | mlr --itsvlite --ocsv cat\
 > bta.csv
 
exportTSV\
 | mlr --itsvlite --ojsonl cat\
 > bta.json
 
