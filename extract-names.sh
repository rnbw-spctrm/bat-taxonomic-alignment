#!/bin/bash 
#
# Extract names from Complete.tsv by Aja Sherman
#
# 2023-02-15 

set -xe

COMPLETE_TSV_HASH=$(preston track file://${PWD}/input/Complete.tsv | grep -oP "hash://sha256/[a-f0-9]{64}" | tail -n1)

NAME_COLUMNS=$(preston cat ${COMPLETE_TSV_HASH} | head -n1 | tr '\t' '\n' | grep -i "^name_")

preston cat ${COMPLETE_TSV_HASH}\
 | mlr --tsvlite cut -f $(echo ${NAME_COLUMNS} | tr ' ' ',')\
 | tail -n+2\
 | tr '\t' '\n'\
 | sort\
 | uniq

