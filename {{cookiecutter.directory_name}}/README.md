# {{cookiecutter.project_title}}


{% if cookiecutter.use_remote_data %}
* data is fetched from {{ cookiecutter.data_repo }}{% endif %}
* build with [DSE-Static-Cookiecutter](https://github.com/acdh-oeaw/dse-static-cookiecutter)


## initial (one time) setup

* run `./shellscripts/script.sh`{% if cookiecutter.use_remote_data %}
* run `./fetch_data.sh`{% endif %}
* run `ant`


## start dev server

* `cd html/`
* `python -m http.server`
* go to [http://0.0.0.0:8000/](http://0.0.0.0:8000/)