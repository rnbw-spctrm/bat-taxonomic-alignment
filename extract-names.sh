#!/bin/bash 
#
# Extract names from Complete.tsv by Aja Sherman
#
# 2023-02-15 

set -xe

COMPLETE_TSV_HASH=$(preston track file://${PWD}/input/Complete.tsv | grep -oE "hash://sha256/[a-f0-9]{64}" | tail -n1)

NAME_COLUMN_PATTERN='^name[_\s][0-9a-zA-Z]+'

preston cat ${COMPLETE_TSV_HASH}\
 | nl\
 | sed -E "s/^\s+//g"\
 | sed -E "s/^1\t/treatmentId\t/g"\
 | sed "s+^+https://linker.bio/line:${COMPLETE_TSV_HASH}!/L1,L+g"\
 | sed "s+.*treatmentId+treatmentId+g"\
 | mlr --tsvlite cut -r -f $NAME_COLUMN_PATTERN,treatmentId\
 | mlr --itsvlite --ocsv reshape -r ${NAME_COLUMN_PATTERN} -o accordingTo,scientificName\
 | mlr --tsvlite sort -f treatmentId
