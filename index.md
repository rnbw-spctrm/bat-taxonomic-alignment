---
layout: home
---

⚠️  work in progress ⚠️

# A Somewhat Standardized Review of Bat Names Across Multiple Taxonomic Authorities

Cite as: 
> Sherman, Aja, Geiselman, Cullen, Poelen, Jorrit, Simmons, Nancy, Reeder, DeeAnn, Upham, Nathan, & Phelps, Kendra. (2023). A Standardized Review of Bat Names Across Multiple Taxonomic Authorities (0.1) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.7915722

The taxonomic boundaries of species and higher-level taxa change relatively frequently as knowledge of population structure and evolutionary relationships improves, and older hypotheses are reframed. For the order Chiroptera (bats), valid names have long been assessed by multiple authorities, but differences among the resulting classifications largely remain unharmonized amongst authorities. We collected and aligned treatments across three primary taxonomic authorities for Chiroptera to create a single dynamic and versioned name translation tool. The resulting Bat Taxonomy Alignment will expedite future taxonomic assessments. The complexities uncovered in this alignment suggest the need for more explicit tracking of taxonomic concepts and usage of names in the future, particularly since biodiversity data (including hosts of zoonotic diseases) are cataloged and tracked using taxonomic names.


[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7915722.svg)](https://doi.org/10.5281/zenodo.7915722) 

[![SWH](https://archive.softwareheritage.org/badge/swh:1:dir:9ba2b7ef8c75873d945ccfd19845df28778e7da8/)](https://archive.softwareheritage.org/swh:1:dir:9ba2b7ef8c75873d945ccfd19845df28778e7da8;origin=https://github.com/jhpoelen/bat-taxonomic-alignment;visit=swh:1:snp:ed17e4d64ad333b0285669fd632ea53c84fd3d16;anchor=swh:1:rev:380935f37f3a4783ace2239baeb626d40366c669)

{%- assign BTA = site.data.names | first | map: "treatmentId" | split: "sha256/" | last | slice: 0,8 | prepend: "BTA@" %}



Do you have questions or suggestions? Please [edit this page](https://github.com/jhpoelen/bat-taxonomic-alignment/edit/main/index.md), [join our weekly meeting](https://globalbioticinteractions.org/covid19), or [open an issue](https://github.com/jhpoelen/bat-taxonomic-alignment/issues/new).

<table><caption>Table 1. <em>{{ BTA }} Resources in XSLX, Google sheet, TSV, CSV, and JSON-L formats.</em></caption><thead><th>name</th><th>description</th></thead>
<tbody>
    <tr><td><a href="./bta.xlsx">bta.xlsx</a></td><td>in proprietary Excel format.</td></tr>
    <tr><td><a href="https://docs.google.com/spreadsheets/d/1JSIr4GJX26LnF6WEl_jvrP6eAiRJc32XbIseeC_Y9DM">Google sheet</a></td><td>Read-only version hosted on Google sheets</td></tr>
    <tr><td><a href="./bta.tsv">bta.tsv</a></td><td>as <a href="https://www.iana.org/assignments/media-types/text/tab-separated-values">Tab Separated Values</a></td></tr>
    <tr><td><a href="./bta.csv">bta.csv</a></td><td>as <a href="https://en.wikipedia.org/wiki/Comma-separated_values">Comma Seperated Values</a></td></tr>
    <tr><td><a href="./bta.json">bta.json</a></td><td>as <a href="https://jsonlines.org/">JSON Lines</a> format</td></tr>

  </tbody>
</table>

<b>status: </b><span id="status">Agreement Index values calculating...</span>

<figure>
  <figcaption>Figure 1. <em>BTA Agreement Index using <a href="https://github.com/politiken-journalism/scale-color-perceptual#readme">Viridis scale</a>.</em> Yellow/light colors indicate more agreement, green/dark shades indicate less agreement.</figcaption>
  <div id="pallette" style="display: flex; flex-direction: row;"></div>
</figure>


<figure>
  <figcaption>Figure 2. <em>A clickable heatmap containing all BTA concepts and their associated agreement index organized in no particular order.</em> Yellow/light colors indicate more agreement, green/dark shades indicate less agreement.</figcaption>
  <div id="map" style="display: flex; flex-direction: row; flex-wrap: wrap;"></div>
</figure>

<br/>



<table><caption>Table 2. <em>{{ BTA }} agreement matrix. Each cell indicates the number of concept <b>dis</b>agreements across catalog pairs. Total number of concepts in {{ BTA }} is <b><span id="totalConcepts">-</span></b>.</em> Yellow/light colors indicate more agreement, green/dark shades indicate less agreement.</caption><thead id="matrixHeader"></thead><tbody id="matrix"></tbody></table>



<table>
  <caption>Table 3. <em>{{ BTA }} treatments, agreement index, and their associated names. The agreement index is ratio of the number of pairwise agreements for a concept versus the total number of possible pairwise agreements. Yellow/light colors indicate more agreement, green/dark shades indicate less agreement. Download table (minus agreement index) as <a href="https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.tsv">tsv</a>, <a href="https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.csv">csv</a>, or <a href="https://raw.githubusercontent.com/jhpoelen/bat-taxonomic-alignment/main/_data/names.json">json</a>.</em></caption>
  <thead><th>treatmentId</th><th>agreementIndex</th><th>name</th><th>accordingTo</th></thead>
  <tbody>
{%- for name in site.data.names %}
{%- assign conceptId = name.treatmentId | split: ",L" | last | split: "." | first %}
{%- assign backgroundColorId = conceptId | modulo: 2 %}
{%- assign colors = "#cff0ff, #effaff" | split: ", " %}
{%- assign color = colors[backgroundColorId] %}
{%- assign conceptId = conceptId | prepend: "BTA_" %}
    <tr id="{{ conceptId }}" style="background-color: {{ color }};">
<td><a href="{{ name.treatmentId }}">{{ conceptId }}{{ name.treatmentId | split: "sha256/" | last | slice: 0,8 | prepend: "@" }}</a></td><td> <div class="{{ conceptId }}"/></td><td> <em>{{ name.scientificName }}</em></td><td> {{ name.accordingTo }}</td>
    </tr>
{%- endfor %}
  </tbody>
</table>





<script src="assets/js/viridis.js"></script>

<script>

  var concepts = {{ site.data.names-wide | jsonify }};

  document.querySelector("#totalConcepts").textContent = concepts.length;

  var matchesTotal = {};
  var mismatchesTotal = {};
 
  const applyColorsForIndex = function(elem, agreementIndex) { 
    elem.style["text-align"] = "center";
    elem.style.background = viridis(agreementIndex);
    elem.style.color = agreementIndex > 0.75 ? "black" : "white"; 
  }
  
  const pallette = [{ index: 1.0, text: "more agreement" }, { index: 0.75, text: "" }, { index: 0.5, text: "" }, { index: 0.25, text: "" }, { index:  0, text: "less agreement"}];
  pallette.forEach(function(box) {
    var palletteBox = document.querySelector("#pallette").appendChild(document.createElement("div"));
    palletteBox.appendChild(document.createElement("div")).textContent = box.index.toFixed(1);    
    if (box.text) { 
       palletteBox.appendChild(document.createElement("div")).textContent = box.text;    
    }

    applyColorsForIndex(palletteBox, box.index);
    palletteBox.style.height = "3em";
    palletteBox.style.width = "10em";
    palletteBox.style["vertical-align"] = "bottom";
    palletteBox.style.align = "center";
    palletteBox.style["justify-content"]= "space-between";


  });
 
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
        mismatchesTotal[totalKey] = (mismatchesTotal[totalKey] | 0) + (1 - agreementValue);
      }
    }
    const nameAgreementIndex = 1.0 * matches.reduce(function(item, accum) { return item + accum; }, 0) / matches.length;

    const conceptId = concept.treatmentId.match(/(.*)(L)(?<conceptId>[0-9]+)[.]tsv$/).groups.conceptId;
  
    const setAgreementIndex = function(item) {
      document
        .querySelectorAll('.' + item.conceptId)
        .forEach(function(elem) { 
          elem.textContent = item.agreementIndex; 
          applyColorsForIndex(elem, item.agreementIndex);
       });

       const square = document
         .querySelector('#map')
         .appendChild(document.createElement('div'));
       applyColorsForIndex(square, item.agreementIndex);
       square.style.width = '0.7em';
       square.style.height = '0.7em';
       square.setAttribute('title', 'click to jump to [' + item.conceptId + ']');
       square.addEventListener(
         "click", 
         function () { history.pushState({}, "", "#map"); document.querySelector('#' + item.conceptId).scrollIntoView(); }, 
         false
       );
    };
 
    setAgreementIndex( {
      treatmentId: concept.treatmentId,
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
      const mismatchCount = mismatchesTotal[catalogA + "*" + catalogB];
      if (mismatchCount) {
          cell.textContent = mismatchCount;
          const agreementIndex = 1 - 1.0 * mismatchCount / concepts.length;
          applyColorsForIndex(cell, agreementIndex);
      } else {
          cell.textContent = "-";
      }
    }); 
  });

  document.querySelector('#status').textContent = 'Agreement Index values calculation done.';


</script>
