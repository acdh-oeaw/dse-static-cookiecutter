# DSE-Static-Cookiecutter

[Cookiecutter](https://github.com/cookiecutter/cookiecutter) template for a Static-Site Digital Scholarly Edition

## what is this for

the current repo should ease the process of publishing XML/TEIs encoded files as a Static-Site Application

## Quickstart

- Install the latest Cookiecutter if you haven't installed it yet (this requires Cookiecutter 1.4.0 or higher) by running `pip install -U cookiecutter`
- To generate a new dse-static-site project run `cookiecutter gh:acdh-oeaw/dse-static-cookiecutter` and answer the following questions, see below:

```json
{
  "directory_name": "dse-static",
  "project_title": "Digital Scholarly Editions Static Site Cookiecutter",
  "project_short_title": "DSE Static-Site",
  "github_org": "acdh-oeaw", // or your GitHub user name
  "github_url": "https://github.com/{{ cookiecutter.github_org }}/{{ cookiecutter.directory_name }}",
  "base_url": "http://url-of-my-awesome-site",
  "redmine_id": "18716", // needed to create an ACDH-CH like imprint
  "update_favicons": ["yes", "no"],
  "darkmode": ["yes", "no"],
  "translations": ["no", "yes"],
  "search_engine": ["typesense", "staticsearch"],
  "data_dir": "", // leave blank if you don't want to load data from a different github repo
  "data_repo": "https://github.com/{{ cookiecutter.github_org }}/{{ cookiecutter.data_dir }}"
}
```

- change into the new created repo, by default `$ cd dse-static`
- Run `./shellscripts.dse-gen.py` with the correct parameter
- DSE-Cookiecutter Setup Guide

This script facilitates the setup process for DSE-Cookiecutter in an OS-agnostic manner. Below are the available actions and their descriptions:

    Download Dependencies (dd):
        Downloads required dependencies including imprint XML files, Saxon HE (Home Edition), and optionally, the static search tool along with its stopwords list.
    Build Index (bi):
        Initiates the process to build the static-search index based on the configured settings.
    Fetch Data (fd):
        Fetches transcriptions from the specified data repository.

Usage:

css

python script.py -a [action]

Options:

    -a, --action: Specifies the action to execute.
        Choices: "dd" (Download Dependencies), "bi" (Build Index), "fd" (Fetch Data)

- run `$ ./shellscripts/dse-gen.py -a dd` to download needed libraries/files
- run `$ ant` to build the HTML-Files
- run `$ ./shellscripts/build_index.sh` to build the fulltext search index. Be aware, you'll need to have ant-contrib installed.
- create a git repo and commit to github
- copy you XML/TEI encoded files you'd like to publish into `data/editions`
- adapt/modify the XSLTs
- adapt/modify global params in `xslt/partials/params.xsl`
- push to github repo and activate github-pages

`docker build -t dse-static:latest .`
`docker run -d -p 80:80 --rm --name dse-static dse-static:latest`
