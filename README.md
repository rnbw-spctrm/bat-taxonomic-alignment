---
# replace uri to point to the name resource you'd like to align
# a url without scheme like https:// (e.g., ```url: foodorganisms.txt```) 
# is assumed to be a local file in working directory
datasets:
    - url: names.csv
      enabled: false
      type: text/csv
    - id: mdd
      enabled: false
      name: Mammal Diversity Database
      type: application/nomer
    - url: _data/names.tsv
      enabled: true
      type: text/tab-separated-values
    - url: https://serv.biokic.asu.edu/ecdysis/content/dwca/UCSB-IZC_DwC-A.zip
      enabled: false
      type: application/dwca
    - url: https://scan-bugs.org:443/portal/webservices/dwc/rss.xml 
      enabled: false
      type: application/rss+xml
# 
taxonomies:
#
# Edit list below to select taxonomies you'd like to work with. 
#
# To enable taxonomies to align with set:
#  enabled: true 
#
# To disable taxonomies to align with set: 
#  enabled: false
#
    - id: itis
      enabled: true
      name: Integrated Taxonomic Information System
    - id: ncbi
      enabled: true
      name: NCBI Taxonomy
    - id: discoverlife
      enabled: false
      name: Discover Life Taxonomy
    - id: batnames
      enabled: true
      name: Bat Names 
    - id: col
      enabled: true
      name: Catalogue of Life
    - id: gbif
      enabled: true
      name: GBIF Backbone Taxonomy
    - id: globi
      enabled: false
      name: GloBI Taxon Graph
    - id: indexfungorum
      enabled: false
      name: Index Fungorum
    - id: mdd
      enabled: true
      name: Mammal Diversity Database
    - id: ott
      enabled: false
      name: Open Tree of Life Taxonomy
    - id: pbdb
      enabled: false
      name: Paleobiology Database
    - id: plazi
      enabled: false
      name: Plazi Treatments
    - id: tpt
      enabled: false
      name: Terrestrial Parasite Tracker Taxonomies
    - id: wfo
      enabled: false
      name: World of Flora Online
---

[![Name Alignment by Nomer](../../actions/workflows/align.yml/badge.svg)](../../actions/workflows/align.yml)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7915722.svg)](https://doi.org/10.5281/zenodo.7915722) 

[![SWH](https://archive.softwareheritage.org/badge/swh:1:dir:9ba2b7ef8c75873d945ccfd19845df28778e7da8/)](https://archive.softwareheritage.org/swh:1:dir:9ba2b7ef8c75873d945ccfd19845df28778e7da8;origin=https://github.com/jhpoelen/bat-taxonomic-alignment;visit=swh:1:snp:ed17e4d64ad333b0285669fd632ea53c84fd3d16;anchor=swh:1:rev:380935f37f3a4783ace2239baeb626d40366c669)

⚠️  work in progress ⚠️

Aligning bat names across taxonomic authorities is a labor intensive task. 

This repository relates the Bat Taxonomic Alignment by Aja Sherman, Cullen Geiselman, et al. to associated names in taxonomic resources like those provided by [Bat Names](https://batnames.org), [Mammal Diversity Database](https://mammaldiversity.org), Handbook of the Mammals of the World, Mammal Species of the World, and more. 

