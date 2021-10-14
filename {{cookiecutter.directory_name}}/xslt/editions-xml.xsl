<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="no" omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="concat($doc_title, ' TEI/XML Version')"></xsl:with-param>
                </xsl:call-template>
                <link rel="stylesheet" id="fundament-styles"  href="../dist/fundament/css/fundament.min.css" type="text/css"></link>
                <link rel="stylesheet" href="../css/style.css" type="text/css"></link>
            </head>
            <body>
                <div class="xml-view">
                    <div class="xml-content">
                        <div class="linescroll">
                            <div class="card xml-prev">
                                <div class="card-body xml-viewarea" style="top: 0px; min-width: 100px;">
                                    <xsl:apply-templates select="//tei:TEI"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:TEI">
        <span class="tnc">
            <span class="tc">&lt;</span>
            <xsl:value-of select="name()"/>
            <xsl:for-each select="@*">
                <span class="ac">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="name()"/>
                </span>
                <span class="avc">
                    <xsl:text>="</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>"</xsl:text>
                </span>
            </xsl:for-each>
            <span class="tc">&gt;</span>
        </span>
            <xsl:apply-templates/>
        <span class="tnc">
            <span class="tc">&lt;</span>
            <xsl:value-of select="concat('/' ,name())"/>
            <span class="tc">&gt;</span>
        </span>
    </xsl:template>
    <xsl:template match="tei:teiHeader">
        <span class="tnc">
            <span class="tc">&lt;</span>
            <xsl:value-of select="name()"/>
            <xsl:for-each select="@*">
                <span class="ac">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="name()"/>
                </span>
                <span class="avc">
                    <xsl:text>="</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>"</xsl:text>
                </span>
            </xsl:for-each>
            <span class="tc">&gt;</span>
        </span>
            <xsl:apply-templates/>
        <span class="tnc">
            <span class="tc">&lt;</span>
            <xsl:value-of select="concat('/' ,name())"/>
            <span class="tc">&gt;</span>
        </span>
    </xsl:template>
    <xsl:template match="tei:text">
        <span class="tnc">
            <span class="tc">&lt;</span>
            <xsl:value-of select="name()"/>
            <xsl:for-each select="@*">
                <span class="ac">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="name()"/>
                </span>
                <span class="avc">
                    <xsl:text>="</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>"</xsl:text>
                </span>
            </xsl:for-each>
            <span class="tc">&gt;</span>
        </span>
            <xsl:apply-templates/>
        <span class="tnc">
            <span class="tc">&lt;</span>
            <xsl:value-of select="concat('/' ,name())"/>
            <span class="tc">&gt;</span>
        </span>
    </xsl:template>
    <xsl:template match="child::*"> 
        <span class="tnc">
            <span class="tc">&lt;</span>
            <xsl:value-of select="name()"/>
            <xsl:for-each select="@*">
                <span class="ac">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="name()"/>
                </span>
                <span class="avc">
                    <xsl:text>="</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>"</xsl:text>
                </span>
            </xsl:for-each>
            <span class="tc">&gt;</span>
        </span>  
        <xsl:apply-templates/>        
        <span class="tnc">
            <span class="tc">&lt;</span>
            <xsl:value-of select="concat('/' ,name())"/>
            <span class="tc">&gt;</span>
        </span>
    </xsl:template>

</xsl:stylesheet>