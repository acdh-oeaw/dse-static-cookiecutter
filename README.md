# DSE-Static-Cookiecutter

[Cookiecutter](https://github.com/cookiecutter/cookiecutter) template for a Static-Site Digital Scholarly Edition

## what is this for

the current repo should ease the process of publishing XML/TEIs encoded files as a Static-Site Application

## Quickstart
* Install the latest Cookiecutter if you haven't installed it yet (this requires Cookiecutter 1.4.0 or higher) by running `pip install -U cookiecutter`
* To generate a new dse-static-site project run `cookiecutter gh:acdh-oeaw/dse-static-cookiecutter` and answer the following questions, see below:

```json
{
    "directory_name": "dse-static",
    "project_title": "Digital Scholarly Editions Static Site Cookiecutter",
    "project_short_title": "DSE Static-Site",
    "github_url": "https://github.com/csae8092/dse-static",
    "color_main": "#88dbdf",
    "color_hover": "#fff",
    "title_xpath": ".//tei:title[@type='main'][1]/text()",
    "redmine_id": "18716"
} 
```
* change into the new created repo, by default `$ cd dse-static`
* run `$ ./script.sh` to download needed libraries/files
* run `$ ant` to build the HTML-Files
* run `$ ./build_index.sh` to build the fulltext search index. Be aware, you'll need to have ant-contrib installed.
* create a git repo and commit to github


* copy you XML/TEI encoded files you'd like to publish into `data/editions`
* adapt/modify the XSLTs
* adapt/modify global params in `xslt/partials/params.xsl`
* push to github repo and activate github-pages


## local development

tested for Linux

* install Fundament, Saxon and Static-Search with `$ ./dl_fundament.sh`, `$ ./dl_saxon.sh` and `$ ./dl_staticsearch.sh` (or just run `$ ./script.sh`)
* build the static files with `$ ant`
* build the search index `$ build_index.sh`

