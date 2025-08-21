# {{cookiecutter.project_title}}


{% if cookiecutter.use_remote_data %}
* data is fetched from {{ cookiecutter.data_repo }}{% endif %}
* build with [DSE-Static-Cookiecutter](https://github.com/acdh-oeaw/dse-static-cookiecutter)


## initial (one time) setup
{% if cookiecutter.use_remote_data %}
* run `./fetch_data.sh`{% else %}
* run `./shellscripts/dl_imprint.sh`
{% endif %}
* run `ant`

## set up GitHub repo
* create a public, new, and empty (without README, .gitignore, license) GitHub repo {{ cookiecutter.github_url }} 
* run `git init` in the root folder of your application {{ cookiecutter.directory_name }}
* execute the commands described under `…or push an existing repository from the command line` in your new created GitHub repo {{ cookiecutter.github_url }}

## start dev server

* `cd html/`
* `python -m http.server`
* go to [http://0.0.0.0:8000/](http://0.0.0.0:8000/)

## publish as GitHub Page

* go to https://{{ cookiecutter.github_url}}/actions/workflows/build.yml
* click the `Run workflow` button


## dockerize your application

* To build the image run: `docker build -t {{ cookiecutter.directory_name }} .`
* To run the container: `docker run -p 80:80 --rm --name {{ cookiecutter.directory_name }} {{ cookiecutter.directory_name }}`
* in case you want to password protect you server, create a `.htpasswd` file (e.g. https://htpasswdgenerator.de/) and modifiy `Dockerfile` to your needs; e.g. run `htpasswd -b -c .htpasswd admin mypassword`

### run image from GitHub Container Registry

`docker run -p 80:80 --rm --name {{cookiecutter.directory_name}} ghcr.io/{{cookiecutter.github_org}}/{{cookiecutter.directory_name}}:main`

## Licenses

This project is released under the [MIT License](LICENSE)

### third-party JavaScript libraries
The code for all third-party JavaScript libraries used is included in the `html/vendor` folder, their respective licenses can be found either in a `LICENSE.txt` file or directly in the header of the `.js` file

### SAXON-HE
The projects also includes Saxon-HE, which is licensed separately under the Mozilla Public License, Version 2.0 (MPL 2.0). See the dedicated [LICENSE.txt](saxon/notices/LICENSE.txt)

