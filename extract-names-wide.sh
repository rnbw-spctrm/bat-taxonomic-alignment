#!/bin/bash 
#
# Extract names from Complete.tsv by Aja Sherman
#
# 2023-02-15 

set -xe

#COMPLETE_TSV_HASH=$(preston track file://${PWD}/input/For_Pub.tsv | grep -oE "hash://sha256/[a-f0-9]{64}" | tail -n1)
COMPLETE_TSV_HASH=hash://sha256/981b8f9ece76eb4418fe82e8dfa077165943fe1d63103fa4a25f21a2d7881e75

NAME_COLUMN_PATTERN='^Name[_\s][0-9a-zA-Z]+'

preston cat ${COMPLETE_TSV_HASH}\
 | nl\
 | tail -n+2\
 | sed -E "s/^\s+//g"\
 | sed -E "s/^2\t/treatmentId\t/g"\
 | sed -E "s+^([0-9]*)+https://linker.bio/line:${COMPLETE_TSV_HASH}!/L2,L\1.tsv+g"\
 | sed "s+.*treatmentId+treatmentId+g"\
 | mlr --tsvlite cut -r -f $NAME_COLUMN_PATTERN,treatmentId\
 | mlr --tsvlite sort -f treatmentId
