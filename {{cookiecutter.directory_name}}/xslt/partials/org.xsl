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
                <xsl:if test="./tei:location[@type='located_in_place']">
                    <xsl:variable name="places" select="document('../data/indices/listplace.xml')//tei:TEI//tei:place"/>
                    <tr>
                        <th>
                            Teil von
                        </th>
                        <td>
                            <ul>
                                <xsl:for-each select="./tei:location[@type='located_in_place']">
                                    <xsl:variable name="key" select="./tei:placeName/@key"/>
                                    <xsl:variable name="corr_place" select="$places//id($key)"/>
                                    <xsl:variable name="coords" select="tokenize($corr_place/tei:location[@type='coords']/tei:geo, ', ')"/>
                                    <li class="map-coordinates" lat="{$coords[1]}" long="{$coords[2]}" subtitle="{./tei:orgName}">
                                        <a href="{$key}.html">
                                            <xsl:value-of select="./tei:placeName"/>
                                        </a>
                                    </li>
                                </xsl:for-each>
                            </ul>
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
