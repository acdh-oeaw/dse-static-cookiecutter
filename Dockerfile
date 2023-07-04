FROM python:3.10-bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx vim openjdk-11-jre-headless ant -y
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.default /etc/nginx/sites-available/default

RUN pip install cookiecutter
RUN mkdir -p /dse-static-cookiecutter
COPY . /dse-static-cookiecutter

RUN cookiecutter /dse-static-cookiecutter --no-input
WORKDIR /dse-static
RUN ./shellscripts/script.sh
RUN pip install -r requirements.txt
RUN python make_translations.py && python update_favicons.py

RUN ant
RUN find /dse-static/html -type f -print0 | xargs -0 chmod 705
EXPOSE 80
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
