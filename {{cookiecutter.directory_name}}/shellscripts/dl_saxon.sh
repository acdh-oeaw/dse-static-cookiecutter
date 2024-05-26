#!/bin/bash
echo "downloading saxon"
curl -LO https://sourceforge.net/projects/saxon/files/Saxon-HE/9.9/SaxonHE9-9-1-7J.zip/download
unzip download -d saxon
rm -rf download