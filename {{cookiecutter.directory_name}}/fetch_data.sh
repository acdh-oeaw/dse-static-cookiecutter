# bin/bash

echo "fetching transkriptions from data_repo"
rm -rf data/editions && mkdir data/editions
curl -LO {{ cookiecutter.data_repo }}/archive/refs/heads/main.zip
unzip main

mv ./{{ cookiecutter.data_dir }}-main/data/editions/ ./data
rm main.zip
rm -rf ./{{ cookiecutter.data_dir }}-main
