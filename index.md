---
layout: home
---
by Aja Sherman, Cullen Geiselman, et al. 

⚠️  work in progress ⚠️

The table below is an exhaustive list of known bats and how they are named.

BTA formulates "treatment" for each known bat. Each treatment has a unique id. You can get associated data in tab-separate values (TSV) for a treatment by clicking on their corresponding taxonomic id link. 

The `name` and `accordingTo` columns contain a name as recognized by some name authority (e.g., batnames, MMD, HMW, MSW). Each treatment has multiple associates names from the various name authorities. Name values with `**` signify that a name authority appeared not to have a name for a particular treatment.

For more information, go [here](https://github.com/jhpoelen/bat-taxonomic-alignment).

[tsv](https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.tsv) / [csv](https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.csv) / [json](https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.json)

|treatmentId|name|accordingTo|
|---|---|---|
{%- for name in site.data.names %}
| [{{ name.treatmentId | split: ",L" | last | split: "." | first | prepend: "BTA:" }}{{ name.treatmentId | split: "sha256/" | last | slice: 0,8 | prepend: "@" }}]({{ name.treatmentId }}) | *{{ name.scientificName }}* | {{ name.accordingTo }} |
{%- endfor %}

