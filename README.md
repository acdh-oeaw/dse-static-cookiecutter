# DSE-Static-Cookiecutter

[Cookiecutter](https://github.com/cookiecutter/cookiecutter) template for a [Static site generator](https://en.wikipedia.org/wiki/Static_site_generator) powered by TEI/XML files

## What is this for

The current repo should ease the process of publishing TEI/XML encoded files as a Static-Site Application using mainly XSLT to generate static HTML files.

> [!IMPORTANT]  
> DSE-Static-Cookiecutter is developed for digital editions projects run at the [ACDH-CH](https://www.oeaw.ac.at/acdh/acdh-ch-home). Therefore some parts of the code (especially the usage imprint service `{{cookiecutter.directory_name}}/shellscripts/dl_imprint.sh`) won't work properly outside of our institutional context.

## Quickstart

> [!IMPORTANT]  
> DSE-Static-Cookiecutter is tested to work on Linux/Mac. To make it work on Windows you'll need to change some parts of the initial setup.

* Install the latest Cookiecutter if you haven't installed it yet (this requires Cookiecutter 2.1.0 or higher) by running `pip install -U cookiecutter`
* To generate a new dse-static-site project run `cookiecutter gh:acdh-oeaw/dse-static-cookiecutter` and answer the appearing questions
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
* [Digital Edition Micro-Editor](https://github.com/acdh-oeaw/de-micro-editor) for customization of interactive features is enabled; contributed by @linxOD
* Geovisualization of places via [leaflet.js](https://leafletjs.com/) powered maps; contributed by @cfhaak and @kisram
* Ships with an [Oxygen XML Editor](https://www.oxygenxml.com/) project `.xpr` including some transformation scenarios for local development/testing of TEI to HTML transformations.

## Full Text Search
As mentioned above, DSE-Static-Cookiecutter implements a faceted full text search with [Typesense](https://typesense.org/). This breaks of course the static site paradigme but as ACDH-CH we are confident to keep our own typesense instance up and running for a long time. If you don't have your own typesense instance you could have a look at https://cloud.typesense.org/. 

Alternatively you could rewrite the XSLT's to produce valid XHTML files and implement a powerful full text search using the awesom [staticSearch](https://github.com/projectEndings/staticSearch).

Previouse versions of DSE-Static-Cookiecutter shipped with an option to implement staticSearch but this had to be dropped due to limited maintainance resources.


## Projects using DSE-Static-Cookiecutter

* https://schnitzler-briefe.acdh.oeaw.ac.at/
* https://schnitzler-tagebuch.acdh.oeaw.ac.at
* https://schnitzler-bahr.acdh.oeaw.ac.at/
* https://amp.acdh.oeaw.ac.at
* https://hanslick.acdh.oeaw.ac.at/
* https://b-vg.acdh.oeaw.ac.at/
* https://thun-korrespondenz.acdh.oeaw.ac.at/
