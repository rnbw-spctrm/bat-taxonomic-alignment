---
layout: home
---

# Bat Taxonomic Alignment (BAT)

by Aja Sherman, Cullen Geiselman, et al. 

⚠️  work in progress ⚠️

For more information, go [here](https://github.com/jhpoelen/bat-taxonomic-alignment).

[tsv](https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.tsv) / [csv](https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.csv) / [json](https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.json)

|treatmentId|name|accordingTo|
|---|---|---|
{%- for name in site.data.names %}
| [{{ name.treatmentId | split: ",L" | last | split: "." | first | prepend: "BTA:" }}{{ name.treatmentId | split: "sha256/" | last | slice: 0,8 | prepend: "@" }}]({{ name.treatmentId }}) | *{{ name.scientificName }}* | {{ name.accordingTo }} |
{%- endfor %}

