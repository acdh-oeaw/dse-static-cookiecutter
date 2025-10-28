<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template name="zoterMetaTags">
        <xsl:param name="zoteroTitle" select="false()"></xsl:param>
        <xsl:param name="pageId" select="''"></xsl:param>
        <xsl:param name="customUrl" select="$base_url"></xsl:param>
        <xsl:variable name="fullUrl" select="concat($customUrl, $pageId)"/>
        <xsl:if test="$zoteroTitle">
            <meta name="citation_title" content="{$zoteroTitle}"/>
        </xsl:if>
        <meta name="citation_editors" content="Andorfer, Hanna; Andorfer, Ronja"/>
        <meta name="citation_publisher" content="Austrian Centre for Digitale Humanities (ACDH)"/>
        <meta name="citation_book_title" content="{$project_title}"/>
        <meta name="citation_public_url" content="{$fullUrl}"/>
        <meta name="citation_date" content="2025"/>
    </xsl:template>
</xsl:stylesheet>