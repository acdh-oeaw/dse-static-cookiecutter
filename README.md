# DSE-Static-Cookiecutter

[Cookiecutter](https://github.com/cookiecutter/cookiecutter) template for a Static-Site Digital Scholarly Edition

## Quickstart
* Install the latest Cookiecutter if you haven't installed it yet (this requires Cookiecutter 1.4.0 or higher) by running `pip install -U cookiecutter`
* To generate a new dse-static-site project run `cookiecutter gh:acdh-oeaw/dse-static-cookiecutter` and answer the following questions, see below:

```json
{
    "directory_name": "dse-static",
    "project_title": "Digital Scholarly Editions Static Site Cookiecutter",
    "project_short_title": "DSE Static-Site",
    "github_url": "https://github.com/acdh-oeaw/dse-static-cookiecutter",
    "color_main": "#88dbdf",
    "color_hover": "#fff",
    "title_xpath": ".//tei:title[@type='main'][1]/text()"
} 
```

* copy you XML/TEI encoded files you'd like to publish into `data/editions`
* adapt/modify the XSLTs