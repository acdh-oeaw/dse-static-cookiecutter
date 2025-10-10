<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:include href="./params.xsl"/>
    <xsl:template name="html_head">
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

        <link href="vendor/bootstrap-5.3.5-dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="vendor/bootstrap-icons/font/bootstrap-icons.min.css" />
        <link rel="stylesheet" href="css/style.css" type="text/css"></link>
        
        {% if cookiecutter.translations == 'yes' %}
        <script src="vendor/i18next/i18next.min.js"></script>
        <script src="vendor/i18next/jquery-i18next.min.js"></script>
        <script src="vendor/i18next//i18nextBrowserLanguageDetector.min.js"></script>
        <script src="vendor/i18next/i18nextHttpBackend.min.js"></script>
        {% endif %}
    </xsl:template>
</xsl:stylesheet>