<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template name="blockquote">
        <xsl:param name="pageId" select="''"></xsl:param>
        <xsl:param name="customUrl" select="$base_url"></xsl:param>
        <xsl:variable name="fullUrl" select="concat($customUrl, $pageId)"/>
        <div>
            <h2 class="fs-4">How to cite</h2>
            <blockquote class="blockquote">
                <p>
                    <xsl:value-of select="$project_title"/>, herausgegeben von Hanna und Ronja, LaLe 2025 (<a href="{$fullUrl}"><xsl:value-of select="$fullUrl"/></a>)
                </p>
            </blockquote>
        </div>
    </xsl:template>
</xsl:stylesheet>