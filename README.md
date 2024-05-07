# DSE-Static-Cookiecutter

[Cookiecutter](https://github.com/cookiecutter/cookiecutter) template for a [Static site generator](https://en.wikipedia.org/wiki/Static_site_generator) powerd by TEI/XML files

## what is this for

The current repo should ease the process of publishing TEI/XML encoded files as a Static-Site Application using mainly XSLT to generate static HTML files.

## Quickstart

> [!IMPORTANT]  
> DSE-Static-Cookiecutter is tested to work on Linx/Mac. To make it work on Windows you'll need to change some parts of the initial set up.

* Install the latest Cookiecutter if you haven't installed it yet (this requires Cookiecutter 2.1.0 or higher) by running `pip install -U cookiecutter`
* To generate a new dse-static-site project run `cookiecutter gh:acdh-oeaw/dse-static-cookiecutter` and answer the appearing questions
* change into the created directory and have a look at the README.md in this directory.

## Features
* generate HTML files from your TEI/XML documents using XSLT
* [GitHub Actions workflows](https://docs.github.com/en/actions/using-workflows) are configured to
  * build your application and serve them via [GitHub Pages](https://pages.github.com/)
  * bake your application into a Dockerfile publish it via GitHub's container registry.
* XSLTs provided by DES-Static-Cookiecutter are designed in a modular fashion, trying to avoid code duplications
* recent version of [Bootstrap](https://getbootstrap.com/) implemented
* opinionated way to organize data/code; but everything can be changed/overwritten/customized
* handling of indices for persons, places, organisations or works is included
* search and filterable overview pages of your editions (table of contents) and indices
* example code on how to implement a faceted full text search powered by [Typesense](https://typesense.org/)
* [Digital Edition Micro-Editor](https://github.com/acdh-oeaw/de-micro-editor) for customization of interactive features is eneabled
* geovisualisation of places via [leaflet.js](https://leafletjs.com/) powered maps
* ships with an [Oxygen XML Editor](https://www.oxygenxml.com/) project `.xpr` including some transformation scenarios for local development/testing of TEI to HTML transformations.

## Projects using DSE-Static-Cookiecutter

* https://schnitzler-briefe.acdh.oeaw.ac.at/
* https://schnitzler-tagebuch.acdh.oeaw.ac.at
* https://schnitzler-bahr.acdh.oeaw.ac.at/
* https://amp.acdh.oeaw.ac.at
* https://hanslick.acdh.oeaw.ac.at/
* https://b-vg.acdh.oeaw.ac.at/
* https://thun-korrespondenz.acdh.oeaw.ac.at/

