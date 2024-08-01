<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:include href="./params.xsl"/>
    <xsl:template match="/" name="html_head">
        <xsl:param name="html_title" select="$project_short_title"></xsl:param>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="{$project_logo}" sizes="any" />
        <title><xsl:value-of select="$html_title"/></title>

        <!-- <link rel="canonical" href="{$base_url}" /> -->
        <meta name="description" content="{$project_title}" />
        
        <meta property="og:type" content="website" />
        <meta property="og:title" content="{$project_short_title}" />
        <meta property="og:description" content="{$project_title}" />
        <!-- <meta property="og:url" content="{$base_url}" /> -->
        <meta property="og:site_name" content="{$project_short_title}" />
	    <meta property="og:image" content="{$project_logo}" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
        <link rel="stylesheet" href="css/style.css" type="text/css"></link>
        <link rel="stylesheet" href="css/micro-editor.css" type="text/css"></link>
        
        {% if cookiecutter.translations == 'yes' %}
        <script src="https://cdn.jsdelivr.net/npm/i18next@21.6.10/i18next.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-i18next@1.2.1/jquery-i18next.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/i18next-browser-languagedetector@6.1.3/i18nextBrowserLanguageDetector.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/i18next-http-backend@1.3.2/i18nextHttpBackend.min.js"></script>
        {% endif %}
    </xsl:template>
</xsl:stylesheet>