<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    
    <xsl:template match="tei:org" name="org_detail">
        <table class="table entity-table">
            <tbody>
                <xsl:if test="./tei:orgName">
                    <tr>
                        <th>
                            Name
                        </th>
                        <td>
                            <xsl:value-of select="./tei:orgName"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:desc">
                    <tr>
                        <th>
                            Beschreibung
                        </th>
                        <td>
                            <xsl:value-of select="./tei:desc"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:idno[@type='GND']">
                    <tr>
                        <th>
                            GND
                        </th>
                        <td>
                            <a href="{./tei:idno[@type='GND']}" target="_blank">
                                <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                            </a>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:idno[@type='WIKIDATA']">
                    <tr>
                        <th>
                            Wikidata ID
                        </th>
                        <td>
                            <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                            </a>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:idno[@type='GEONAMES']">
                <tr>
                    <th>
                        Geonames ID
                    </th>
                    <td>
                        <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                            <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                        </a>
                    </td>
                </tr>
                </xsl:if>
                <xsl:if test="./tei:note">
                    <tr>
                        <th>
                            Notiz
                        </th>
                        <td>
                            <xsl:value-of select="./tei:note"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:noteGrp/tei:note[@type='mentions']">
                    <tr>
                        <th>
                            Erwähnt in
                        </th>
                        <td>
                            <ul>
                                <xsl:for-each select="./tei:noteGrp/tei:note[@type='mentions']">
                                    <li>
                                        <a href="{replace(@target, '.xml', '.html')}">
                                            <xsl:value-of select="./text()"/>
                                        </a>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </td>
                    </tr>
                </xsl:if>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>
