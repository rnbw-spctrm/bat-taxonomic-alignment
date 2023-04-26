#!/bin/bash 
#
# Extract names from Complete.tsv by Aja Sherman
#
# 2023-02-15 

set -xe

COMPLETE_TSV_HASH=hash://sha256/306cd3c999895af317044442e86fac33769ce178f6670b050683ca0ea80e6c67

NAME_COLUMN_PATTERN='^Name[_\s][0-9a-zA-Z]+'

preston cat ${COMPLETE_TSV_HASH}\
 | nl\
 | tail -n+2\
 | sed -E "s/^\s+//g"\
 | sed -E "s/^2\t/treatmentId\t/g"\
 | sed -E "s+^([0-9]*)+https://linker.bio/line:${COMPLETE_TSV_HASH}!/L2,L\1.tsv+g"\
 | sed "s+.*treatmentId+treatmentId+g"\
 | mlr --tsvlite cut -r -f $NAME_COLUMN_PATTERN,treatmentId\
 | mlr --itsvlite --ocsv reshape -r ${NAME_COLUMN_PATTERN} -o accordingTo,scientificName\
 | mlr --tsvlite sort -f treatmentId
