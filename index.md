---
layout: home
---
by Aja Sherman, Cullen Geiselman, et al. 

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7915722.svg)](https://doi.org/10.5281/zenodo.7915722) 

⚠️  work in progress ⚠️

Include 

 name | description 
 ---  | ---
 [bta.xlsx](./bta.xlsx) | description here
 [google sheet](https://docs.google.com/spreadsheets/d/1JSIr4GJX26LnF6WEl_jvrP6eAiRJc32XbIseeC_Y9DM/) | description here
 [bta.tsv](./bta.tsv) | description here
 [bta.csv](./bta.csv) | description here
 [bta.json](./bta.json) | description here


The table below is an exhaustive list of known bats and how they are named.

The Bat Taxonomic Alignment (BTA) formulates "treatment" for each known bat. Each treatment has a unique id. You can get associated data in tab-separate values (TSV) for a treatment by clicking on their corresponding taxonomic id link. 

The `name` and `accordingTo` columns contain a name as recognized by some name authority (e.g., batnames, MDD, HMW, MSW). Each treatment has multiple associates names from the various name authorities. Name values with `**` signify that a name authority appeared not to have a name for a particular treatment.

Do you have questions or suggestions? Please [edit this page](https://github.com/jhpoelen/bat-taxonomic-alignment/edit/main/index.md), [join our weekly meeting](https://globalbioticinteractions.org/covid19), or [open an issue](https://github.com/jhpoelen/bat-taxonomic-alignment/issues/new).


<bold>status:</bold><div id="status">Agreement Index values calculating...</div>

<br/>

{%- assign BTA = site.data.names | first | map: "treatmentId" | split: "sha256/" | last | slice: 0,8 | prepend: "BTA@" %}

<table><caption>Table 1. <em>{{ BTA }} agreement matrix. Each cell indicates the number of concept agreements across catalog pairs. Total number of concepts in {{ BTA }} is <b><span id="totalConcepts">-</span></b>.</em></caption><thead id="matrixHeader"></thead><tbody id="matrix"></tbody></table>



<table>
  <caption>Table 2. <em>{{ BTA }} treatments, agreement index, and their associated names. The agreement index is ratio of the number of pairwise agreements for a concept versus the total number of possible pairwise agreements. Download table (minus agreement index) as <a href="https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.tsv">tsv</a>, <a href="https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.csv">csv</a>, or <a href="https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.json">json</a>.</em></caption>
  <thead><th>treatmentId</th><th>agreementIndex</th><th>name</th><th>accordingTo</th></thead>
  <tbody>
{%- for name in site.data.names %}
{%- assign conceptId = name.treatmentId | split: ",L" | last | split: "." | first | prepend: "BTA_" %}
    <tr>
<td><a href="{{ name.treatmentId }}">{{ conceptId }}{{ name.treatmentId | split: "sha256/" | last | slice: 0,8 | prepend: "@" }}</a></td><td> <div class="{{ conceptId }}"/></td><td> <em>{{ name.scientificName }}</em></td><td> {{ name.accordingTo }}</td>
    </tr>
{%- endfor %}
  </tbody>
</table>

<script>
  var concepts = {{ site.data.names-wide | jsonify }};

  document.querySelector("#totalConcepts").textContent = concepts.length;

  var matchesTotal = {};
  
  var agreementIndex = concepts.forEach(function(concept) {
    const catalogNames = Object
        .keys(concept)
        .filter(function(key) { return key.match(/^Name.*/) != null; })
        .sort();
    
    const matches = [];
    for (var i = 0; i < catalogNames.length; i++) {
      for (var j = i+1; j < catalogNames.length; j++) {  
        const nameA = concept[catalogNames[i]];
        const nameB = concept[catalogNames[j]];
        const agreementValue =  nameA === nameB ? 1 : 0;
        matches.push(agreementValue);
        const totalKey = catalogNames[i] + '*' + catalogNames[j]; 
        matchesTotal[totalKey] = (matchesTotal[totalKey] | 0) + agreementValue;
      }
    }
    const nameAgreementIndex = 1.0 * matches.reduce(function(item, accum) { return item + accum; }, 0) / matches.length;

    const conceptId = concept.treatmentId.match(/(.*)(L)(?<conceptId>[0-9]+)[.]tsv$/).groups.conceptId;
  
    const setAgreementIndex = function(item) {
      document
        .querySelectorAll('.' + item.conceptId)
        .forEach(function(elem) { elem.textContent = item.agreementIndex; });
    };
 
    setAgreementIndex( {
      conceptId: 'BTA_' + conceptId,
      agreementIndex: nameAgreementIndex.toFixed(1),
      catalogs: catalogNames
    });
  });

  var catalogsMatched = Object
    .keys(matchesTotal)
    .reduce(function (accum, key) { 
       key.split("*").forEach(function(item) { if (accum.indexOf(item) == -1) { accum.push(item); } });
       return accum }, [])
    .sort();

  

  document.querySelector('#matrixHeader').appendChild(document.createElement("th"));
 
  catalogsMatched.forEach(function (catalogA) {
    var catalogName = catalogA.replace(/^Name[ _]/, '');
    document.querySelector('#matrixHeader').appendChild(document.createElement("th")).textContent = catalogName;
    var row = document.querySelector('#matrix').appendChild(document.createElement("tr"));
    row.appendChild(document.createElement("td")).textContent = catalogName;
    catalogsMatched.forEach(function (catalogB) {
      var cell = row.appendChild(document.createElement("td"));
      cell.textContent = matchesTotal[catalogA + "*" + catalogB] || '-'; 
    }); 
  });

  document.querySelector('#status').textContent = 'Agreement Index values calculation done.';


</script>
