#!/bin/bash

# hacky way to make shure the script 
# gets allways run from parent-dir 
# so relative paths get resolved the righ way
script_location_dir="${BASH_SOURCE[0]}"
cd $script_location_dir && cd ..
# run scripts
./shellscripts/dl_imprint.sh
./shellscripts/dl_saxon.sh
./shellscripts/dl_staticsearch.sh
