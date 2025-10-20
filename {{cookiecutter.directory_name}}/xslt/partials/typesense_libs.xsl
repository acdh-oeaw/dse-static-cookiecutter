<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:param name="clickme" select="true()"/>
    <xsl:template name="typesense_libs">

        <link rel="stylesheet" href="vendor/instantsearch-themes/algolia-min.css"/>
        <script src="vendor/instantsearch/instantsearch.production.min.js"></script>
        <script src="vendor/typesense-instantsearch-adapter/typesense-instantsearch-adapter.min.js"></script>

    </xsl:template>
</xsl:stylesheet>
