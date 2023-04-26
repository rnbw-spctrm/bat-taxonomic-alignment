#!/bin/bash 
#
# Track exported BTA version as provided by Aja Sherman
#
# Note that carriage returns have been replaced by whitespaces to avoid spreadsheet programs prematurely splitting rows.
# See https://github.com/jhpoelen/bat-taxonomic-alignment/issues/9
#
# 2023-04-26
#

set -xe

preston track file://${PWD}/input/For_Pub_carriage_return_as_whitespace.tsv\
 | grep -oE "hash://sha256/[a-f0-9]{64}"\
 | tail -n1
