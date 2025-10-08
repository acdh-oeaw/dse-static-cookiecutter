<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:import href="partials/params.xsl"/>
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>API: <xsl:value-of select="$project_short_title"/></title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <list>
                        <head>Editions</head>
                        <xsl:for-each select="collection('../data/editions?select=*.xml')//tei:TEI">
                            <xsl:sort>
                                <xsl:value-of select="current()/@xml:id"/>
                            </xsl:sort>
                            <xsl:variable name="xmlid" select="current()/@xml:id"/>
                            <xsl:variable name="title" select="normalize-space(string-join(.//tei:titleStmt/tei:title[1]//text()))"/>
                            <item>
                                <title><xsl:value-of select="$title"/></title>
                                <ptr target="{$xmlid}"/>
                            </item>
                        </xsl:for-each>
                    </list>
                    <list>
                        <head>Indices</head>
                        <xsl:for-each select="collection('../data/indices?select=*.xml')//tei:TEI">
                            <xsl:sort>
                                <xsl:value-of select="current()/@xml:id"/>
                            </xsl:sort>
                            <xsl:variable name="xmlid" select="current()/@xml:id"/>
                            <xsl:variable name="title" select="normalize-space(string-join(.//tei:titleStmt/tei:title[1]//text()))"/>
                            <item>
                                <title><xsl:value-of select="$title"/></title>
                                <ptr target="{$xmlid}"/>
                            </item>
                        </xsl:for-each>
                    </list>
                    <list>
                        <head>Meta</head>
                        <xsl:for-each select="collection('../data/meta?select=*.xml')//tei:TEI">
                            <xsl:sort>
                                <xsl:value-of select="current()/@xml:id"/>
                            </xsl:sort>
                            <xsl:variable name="xmlid" select="current()/@xml:id"/>
                            <xsl:variable name="title" select="normalize-space(string-join(.//tei:titleStmt/tei:title[1]//text()))"/>
                            <item>
                                <title><xsl:value-of select="$title"/></title>
                                <ptr target="{$xmlid}"/>
                            </item>
                        </xsl:for-each>
                    </list>
                </body>
            </text>
        </TEI>
        
        
            <xsl:for-each
                select="collection('../data/*/?select=*.xml')//tei:TEI">
                <xsl:sort>
                    <xsl:value-of select="current()/@xml:id"/>
                </xsl:sort>
                
                
            </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>