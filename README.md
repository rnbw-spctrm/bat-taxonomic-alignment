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
    - url: names.tsv
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

⚠️  work in progress ⚠️

Aligning bat names across taxonomic authorities is a labor intensive task. 

This repository relates the Bat Taxonomic Alignment by Aja Sherman, Cullen Geiselman, et al. to associated names in taxonomic resources like those provided by [Bat Names](https://batnames.org), [Mammal Diversity Database](https://mammaldiversity.org), Handbook of the Mammals of the World, Mammal Species of the World, and more. 

