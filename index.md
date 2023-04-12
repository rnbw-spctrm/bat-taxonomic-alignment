---
layout: home
---
by Aja Sherman, Cullen Geiselman, et al. 

⚠️  work in progress ⚠️

The table below is an exhaustive list of known bats and how they are named.

The Bat Taxonomic Alignment (BTA) formulates "treatment" for each known bat. Each treatment has a unique id. You can get associated data in tab-separate values (TSV) for a treatment by clicking on their corresponding taxonomic id link. 

The `name` and `accordingTo` columns contain a name as recognized by some name authority (e.g., batnames, MMD, HMW, MSW). Each treatment has multiple associates names from the various name authorities. Name values with `**` signify that a name authority appeared not to have a name for a particular treatment.

Do you have questions or suggestions? Please [edit this page](https://github.com/jhpoelen/bat-taxonomic-alignment/edit/main/index.md), [join our weekly meeting](https://globalbioticinteractions.org/covid19), or [open an issue](https://github.com/jhpoelen/bat-taxonomic-alignment/issues/new).

Download table as [tsv](https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.tsv), [csv](https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.csv), or [json](https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.json).

|treatmentId|name|accordingTo|
|---|---|---|
{%- for name in site.data.names %}
| [{{ name.treatmentId | split: ",L" | last | split: "." | first | prepend: "BTA:" }}{{ name.treatmentId | split: "sha256/" | last | slice: 0,8 | prepend: "@" }}]({{ name.treatmentId }}) | *{{ name.scientificName }}* | {{ name.accordingTo }} |
{%- endfor %}

