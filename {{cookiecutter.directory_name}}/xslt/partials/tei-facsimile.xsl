<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "tei-facsimile" can handle the tei/xml tag facsimile that contains the tag graphic.</p> 
            <p>The template uses the url of these tags to create one or more html images.</p>
        </desc>    
    </doc>
    
    <xsl:template match="tei:facsimile">
        <xsl:param name="iiif-ext" select="'full/full/0/default.jpg'"/>        
        <xsl:if test="./tei:surface">
            <xsl:for-each select="./tei:surface/tei:graphic">
                <img class="tei-xml-images">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat(@url , $iiif-ext)"/>
                    </xsl:attribute>
                </img>
            </xsl:for-each>
        </xsl:if>
    </xsl:template> 
</xsl:stylesheet>