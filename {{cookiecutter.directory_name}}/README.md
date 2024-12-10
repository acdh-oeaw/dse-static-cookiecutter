# {{cookiecutter.project_title}}


{% if cookiecutter.use_remote_data %}
* data is fetched from {{ cookiecutter.data_repo }}{% endif %}
* build with [DSE-Static-Cookiecutter](https://github.com/acdh-oeaw/dse-static-cookiecutter)


## initial (one time) setup
{% if cookiecutter.use_remote_data %}
* run `./shellscripts/dl_saxon.sh`
* run `./fetch_data.sh`{% else %}
* run `./shellscripts/script.sh`
{% endif %}
* run `ant`


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
