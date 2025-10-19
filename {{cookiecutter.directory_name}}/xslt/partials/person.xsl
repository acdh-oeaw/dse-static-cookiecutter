<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="xsl tei xs">

    <xsl:template match="tei:person" name="person_detail">

        <dl>
            <xsl:if test="./tei:birth/tei:date">

                <dt> Geburtsdatum </dt>
                <dd>
                    <xsl:value-of select="./tei:birth/tei:date"/>
                </dd>
            </xsl:if>
            <xsl:if test="./tei:death/tei:date">

                <dt> Sterbedatum </dt>
                <dd>
                    <xsl:value-of select="./tei:death/tei:date"/>
                </dd>
            </xsl:if>

            <xsl:if test="./tei:idno">

                <dt> Identifiers </dt>
                
                    <xsl:for-each select="./tei:idno">
                        <dd>
                        <xsl:choose>
                            <xsl:when test="starts-with(./text(), 'http')">
                                <a href="{./text()}">
                                    <xsl:value-of select="."/>
                                </a>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                            </xsl:otherwise>
                        </xsl:choose>
                        </dd>
                    </xsl:for-each>

            </xsl:if>
            <xsl:if test="./tei:noteGrp/tei:note[@type = 'mentions']">

                <dt> Erwähnt in </dt>
                <dd>

                    <xsl:for-each select="./tei:noteGrp/tei:note[@type = 'mentions']">

                        <a href="{replace(@target, '.xml', '.html')}">
                            <xsl:value-of select="./text()"/>
                        </a>
                    </xsl:for-each>
                </dd>
            </xsl:if>
        </dl>
    </xsl:template>
</xsl:stylesheet>
