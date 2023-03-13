<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:template match="tei:person" name="person_detail">
        <table class="table entity-table">
            <tbody>
                <xsl:if test="./tei:birth/tei:date">
                <tr>
                    <th>
                        Geburtsdatum
                    </th>
                    <td>
                        <xsl:value-of select="./tei:birth/tei:date"/>
                    </td>
                </tr>
                </xsl:if>
                <xsl:if test="./tei:death/tei:date">
                <tr>
                    <th>
                        Sterbedatum
                    </th>
                    <td>
                        <xsl:value-of select="./tei:death/tei:date"/>
                    </td>
                </tr>
                </xsl:if>
                <xsl:if test="./tei:idno[@type='GND']/text()">
                    <tr>
                        <th>
                            GND ID
                        </th>
                        <td>
                            <a href="{./tei:idno[@type='GND']}" target="_blank">
                                <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                            </a>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
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
                <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
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
                <xsl:if test="./tei:listEvent">
                <tr>
                    <th>
                        Erwähnt in
                    </th>
                    <td>
                        <ul>
                            <xsl:for-each select="./tei:listEvent/tei:event">
                                <li>
                                    <a href="{replace(./tei:linkGrp/tei:link/@target, '.xml', '.html')}">
                                        <xsl:value-of select="./tei:p/tei:title"/>
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