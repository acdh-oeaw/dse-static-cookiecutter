# bin/bash

echo "fetching transkriptions from data_repo"
rm -rf data/editions && mkdir data/editions
rm -rf data/indices && mkdir data/indices
rm -rf data/meta && mkdir data/meta
curl -LO {{ cookiecutter.data_repo }}/archive/refs/heads/main.zip
unzip main

mv ./{{ cookiecutter.data_dir }}-main/data/editions/ ./data
mv ./{{ cookiecutter.data_dir }}-main/data/indices/ ./data
mv ./{{ cookiecutter.data_dir }}-main/data/meta/ ./data

rm main.zip
rm -rf ./{{ cookiecutter.data_dir }}-main
