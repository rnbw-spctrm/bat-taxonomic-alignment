#!/bin/bash 
#
# Extract names from Complete.tsv by Aja Sherman
#
# 2023-02-15 

set -xe

COMPLETE_TSV_HASH=$(preston track file://${PWD}/input/Complete.tsv | grep -oE "hash://sha256/[a-f0-9]{64}" | tail -n1)

NAME_COLUMNS=$(preston cat ${COMPLETE_TSV_HASH} | head -n1 | tr '\t' '\n' | grep -oiE "^name_[a-zA-Z0-9]+" | tr '\n' ',')

preston cat ${COMPLETE_TSV_HASH}\
 | mlr --tsvlite cut -f $NAME_COLUMNS\
 | mlr --itsvlite --ocsv reshape -i ${NAME_COLUMNS} -o id,scientificName\
 | sort\
 | uniq
