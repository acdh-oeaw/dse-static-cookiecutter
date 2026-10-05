<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template name="datatables_import">
    <link rel="stylesheet" href="vendor/datatables/datatables.min.css" />
    <link rel="stylesheet" href="js/datatables_custom/datatables_custom.css" />
    <script src="vendor/datatables/datatables.min.js" ></script>
    </xsl:template>
</xsl:stylesheet>