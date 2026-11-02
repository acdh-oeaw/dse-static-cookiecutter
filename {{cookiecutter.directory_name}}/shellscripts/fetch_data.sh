#!/bin/bash

echo "fetching transkriptions from data_repo"
rm -rf data/
git clone --depth=1 --branch main --single-branch {{ cookiecutter.data_repo }}.git
dataHash=$(git -C ./{{ cookiecutter.data_dir }} rev-parse HEAD)
echo -n "${dataHash}" > ./datahash.txt
mv ./{{ cookiecutter.data_dir }}/data .
rm -rf ./{{ cookiecutter.data_dir }}
echo "fetch imprint"
./shellscripts/dl_imprint.sh


