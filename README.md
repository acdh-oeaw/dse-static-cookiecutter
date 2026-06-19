[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14260530.svg)](https://doi.org/10.5281/zenodo.14260530)
[![Test and Deploy](https://github.com/acdh-oeaw/dse-static-cookiecutter/actions/workflows/static.yml/badge.svg)](https://github.com/acdh-oeaw/dse-static-cookiecutter/actions/workflows/static.yml)

# DSE-Static-Cookiecutter

[Cookiecutter](https://github.com/cookiecutter/cookiecutter) template for a [Static site generator](https://en.wikipedia.org/wiki/Static_site_generator) powered by TEI/XML files

## What is this for

The current repo should ease the process of publishing TEI/XML encoded files as a Static-Site Application using mainly XSLT to generate static HTML files.

> [!IMPORTANT]  
> DSE-Static-Cookiecutter is developed for digital editions projects run at the [ACDH](https://www.oeaw.ac.at/acdh/acdh-home). Therefore some parts of the code (especially the usage imprint service `{{cookiecutter.directory_name}}/shellscripts/dl_imprint.sh`) won't work properly outside of our institutional context.

## Quickstart

> [!IMPORTANT]  
> DSE-Static-Cookiecutter is tested to work on Linux/Mac. To make it work on Windows you'll need to change some parts of the initial setup.

* Make sure you have [uv](https://docs.astral.sh/uv/) as Python package and project manager installed
* To generate a new dse-static-site project run `uvx cookiecutter gh:acdh-oeaw/dse-static-cookiecutter` and answer the appearing questions
* Change into the created directory, have a look at the README.md in this directory and start developing/customizing your great digital editions project.

## Features

* Generate HTML files from your TEI/XML documents using XSLT
* [GitHub Actions workflows](https://docs.github.com/en/actions/using-workflows) are configured to
  * build your application and serve them via [GitHub Pages](https://pages.github.com/)
  * bake your application into a Dockerfile publish it via GitHub's container registry.
* XSLTs provided by DSE-Static-Cookiecutter are designed in a modular fashion, trying to avoid code duplications
* Recent version of [Bootstrap](https://getbootstrap.com/) implemented
* Opinionated way to organize data/code; but everything can be changed/overwritten/customized
* Handling of indices for persons, places, organizations, or works is included
* Search and filterable overview pages of your editions (table of contents) and indices
* Example code on how to implement a faceted full-text search powered by [Typesense](https://typesense.org/)
* Geovisualization of places via [leaflet.js](https://leafletjs.com/) powered maps; contributed by [@cfhaak](https://github.com/cfhaak) and [@kisram](https://github.com/kisram)
* Ships with an [Oxygen XML Editor](https://www.oxygenxml.com/) project `.xpr` including some transformation scenarios for local development/testing of TEI to HTML transformations.

## Full Text Search

As mentioned above, DSE-Static-Cookiecutter implements a faceted full text search with [Typesense](https://typesense.org/). This breaks of course the static site paradigme but as ACDH we are confident to keep our own typesense instance up and running for a long time. If you don't have your own typesense instance you could have a look at <https://cloud.typesense.org/>.

Alternatively you could rewrite the XSLT's to produce valid XHTML files and implement a powerful full text search using the awesome [staticSearch](https://github.com/projectEndings/staticSearch).

Previouse versions of DSE-Static-Cookiecutter shipped with an option to implement staticSearch but this had to be dropped due to limited maintainance resources.

## Plug-ins/Customization

* Try out [Digital Edition Micro-Editor](https://github.com/acdh-oeaw/de-micro-editor) for customization of interactive features

## Projects using DSE-Static-Cookiecutter (by start date)

### 2021

* [Arthur Schnitzler: Tagebuch](https://schnitzler-tagebuch.acdh.oeaw.ac.at) (ongoing)
* [Arthur Schnitzler: Lektüren](https://schnitzler-lektueren.acdh.oeaw.ac.at)

### 2022

* [Lesen im Alpental](https://rita.acdh.oeaw.ac.at)
* [Die Korrespondenz von Leo von Thun-Hohenstein](https://thun-korrespondenz.acdh.oeaw.ac.at)
* [A Digital Edition of W. H. Auden's Letters to Stella Musulin](https://amp.acdh.oeaw.ac.at)
* [Arthur Schnitzler: Briefe](https://schnitzler-briefe.acdh.oeaw.ac.at) (ongoing)
* [Hermann Bahr – Arthur Schnitzler](https://schnitzler-bahr.acdh.oeaw.ac.at)

### 2023

* [Die Entstehung des Bundes-Verfassungsgesetzes 1920](https://b-vg.acdh.oeaw.ac.at) (ongoing)
* [Hanslick Online](https://hanslick.acdh.oeaw.ac.at) (ongoing)
* [Die Korrespondenz der Kaiserin Eleonora Magdalena (1655–1720)](https://kaiserin-eleonora.oeaw.ac.at) (ongoing)
* [Choralhandschriften und Drucke der Zentralbibliothek der Wiener Franziskanerprovinz Graz](https://ofm-graz.acdh.oeaw.ac.at)

### 2024

* [Sitzungsprotokolle der Österreichischen Akademie der Wissenschaften](https://akademieprotokolle.acdh.oeaw.ac.at) (ongoing)
* [Grazer Nuntiatur: Korrespondenz 1580–1602](https://grazer-nuntiatur.acdh.oeaw.ac.at)
* [Die große Transformation](https://gtrans.acdh.oeaw.ac.at)
* [Mächtekongresse 1818–1822](https://maechtekongresse.acdh.oeaw.ac.at)
* [Josef Staribacher: Tagebücher](https://staribacher.acdh.oeaw.ac.at)
* Paul Tillich: Korrespondenz 1886–1933 (ongoing)
* [Religion and Culture by Paul Tillich](https://tillich-lectures.acdh-dev.oeaw.ac.at) (ongoing)
* [Das erste Wiener Merkantilprotokoll](https://wmp1.acdh.oeaw.ac.at)
  
### 2025

* [Downed Allied Air Crew Database Austria 1940–1945](https://daacda.acdh.oeaw.ac.at)
* [Nuntiatur Pius XI: Korrespondenz 1923–1936](https://nuntiatur-pius-xi.acdh.oeaw.ac.at)
* [Arthur Schnitzler: Interviews](https://schnitzler-interviews.acdh.oeaw.ac.at)
* [Wiener Schnitzler – Schnitzlers Wien](https://wienerschnitzler.org)
* [Karl Kraus: Rechtsakten der Kanzlei Oskar Samek](https://www.kraus.wienbibliothek.at/)
* [Arthur Schnitzler: Kulturveranstaltungen](https://schnitzler-kultur.acdh.oeaw.ac.at)
* [Auden in Austria Digital](https://auden.acdh.oeaw.ac.at/) (ongoing)
* [Karl Kraus 1933: Dritte Walpurgisnacht](https://kraus1933.acdh.oeaw.ac.at/) (ongoing)
* [Oberkammeramtsrechnungsbücher der Stadt Wien 1424 bis 1768](https://okar.acdh.oeaw.ac.at/)

### 2026

* Die Protokolle des österreichischen Kabinettsrates 1919–1920 (ongoing)
* Digitale Edition des Tagebuchs von Max Kalbeck (1896–1897)
* Leopold I. Korrespondenz (ongoing)
* Digitale Karl Kraus Bibliographie (ongoing)
* Letters 1916 (conversion to static)
* Die Ministerratsprotokolle 1848–1918 (conversion to static)

# LICENSE

**dse-static-cookiecutter** is licensed under the MIT License. See the LICENSE file for details. Be aware that this does not apply to third party libraries included in this project as [Saxon]({{cookiecutter.directory_name}}/saxon) or CSS/JS libraries included in [vendor]({{cookiecutter.directory_name}}/html/vendor).
