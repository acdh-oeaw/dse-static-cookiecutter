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
    "github_url": "https://github.com/acdh-oeaw/dse-static-cookiecutter",
    "base_url": "http://url-of-my-awesome-site",
    "redmine_id": "18716",
    "update_favicons": ["yes", "no"],
    "darkmode": ["yes", "no"],
    "translations": ["yes", "no"],
    "search_engine": ["typesense", "staticsearch"]
} 
```
* change into the new created repo, by default `$ cd dse-static`
* run `$ ./shellscripts/script.sh` to download needed libraries/files
* run `$ ant` to build the HTML-Files
* run `$ ./shellscripts/build_index.sh` to build the fulltext search index. Be aware, you'll need to have ant-contrib installed.
* create a git repo and commit to github


* copy you XML/TEI encoded files you'd like to publish into `data/editions`
* adapt/modify the XSLTs
* adapt/modify global params in `xslt/partials/params.xsl`
* push to github repo and activate github-pages


## local development

tested for Linux

* install Fundament, Saxon and Static-Search with `$ ./shellscripts/dl_fundament.sh`, `$ ./shellscripts/dl_saxon.sh` and `$ ./shellscripts/dl_staticsearch.sh` (or just run `$ ./shellscripts/script.sh`)
* build the static files with `$ ant`
* build the search index `$ ./shellscripts/build_index.sh`

