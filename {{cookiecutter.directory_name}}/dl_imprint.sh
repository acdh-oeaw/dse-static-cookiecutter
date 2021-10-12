# bin/bash

REDMINE_ID={{cookiecutter.redmine_id}}
IMPRINT_XML=./data/imprint.xml
rm ${IMPRINT_XML}
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo "<root>" >> ${IMPRINT_XML}
curl https://shared.acdh.oeaw.ac.at/acdh-common-assets/api/imprint.php?serviceID=${REDMINE_ID} >> ${IMPRINT_XML}
echo "</root>" >> ${IMPRINT_XML}