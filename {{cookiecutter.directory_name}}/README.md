# {{cookiecutter.project_title}}


{% if cookiecutter.data_dir %}
* data is fetched from {{ cookiecutter.data_repo }}{% endif %}
* build with [DSE-Static-Cookiecutter](https://github.com/acdh-oeaw/dse-static-cookiecutter)


## initial (one time) setup

* run `./shellscripts/script.sh`{% if cookiecutter.data_dir %}
* run `./fetch_data.sh`{% endif %}
* run `ant`
