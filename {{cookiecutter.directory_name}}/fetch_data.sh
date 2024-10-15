# bin/bash

echo "fetching transkriptions from data_repo"
rm -rf data/
curl -LO {{ cookiecutter.data_repo }}/archive/refs/heads/main.zip
unzip main

mv ./{{ cookiecutter.data_dir }}-main/data/ .

rm main.zip
rm -rf ./{{ cookiecutter.data_dir }}-main

echo "fetch imprint"
./shellscripts/dl_imprint.sh
