#!/bin/bash

REDMINE_ID="{{cookiecutter.redmine_id}}?format=xhtml&locale="
IMPRINT_XML=./data/imprint.xml
rm ${IMPRINT_XML}
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo "<root>" >> ${IMPRINT_XML}
echo '<div lang="de">' >> ${IMPRINT_XML}
curl https://imprint.acdh.oeaw.ac.at/${REDMINE_ID}de >> ${IMPRINT_XML}
echo "</div>"  >> ${IMPRINT_XML}
echo '<div lang="en">' >> ${IMPRINT_XML}
curl https://imprint.acdh.oeaw.ac.at/${REDMINE_ID}en >> ${IMPRINT_XML}
echo "</div>" >> ${IMPRINT_XML}
echo "</root>" >> ${IMPRINT_XML}