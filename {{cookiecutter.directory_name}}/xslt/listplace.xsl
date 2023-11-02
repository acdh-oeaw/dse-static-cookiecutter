<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet {% if cookiecutter.search_engine == 'staticsearch' %} 
    xmlns="http://www.w3.org/1999/xhtml" {% endif %}
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    {% if cookiecutter.search_engine == 'staticsearch' %}
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    {% else %}
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>
    {% endif %}

    <xsl:import href="partials/html_navbar.xsl"/>
    <xsl:import href="partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/tabulator_dl_buttons.xsl"/>
    <xsl:import href="partials/tabulator_js.xsl"/>
    <xsl:import href="partials/place.xsl"/>
    
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:titleStmt/tei:title[1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html {% if cookiecutter.translations == 'staticsearch' %} xmlns="http://www.w3.org/1999/xhtml" {% endif %} class="h-100">
            
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main>
                    <div class="container">
                        <h1><xsl:value-of select="$doc_title"/></h1>
                        <div id="map"/>
                        <table class="table" id="myTable">
                            <thead>
                                <tr>
                                    <th scope="col" width="20" tabulator-formatter="html" tabulator-headerSort="false" tabulator-download="false">#</th>
                                    <th scope="col" tabulator-headerFilter="input">Ortsname</th>
                                    <th scope="col" tabulator-headerFilter="input">Lat</th>
                                    <th scope="col" tabulator-headerFilter="input">Long</th>
                                    <th scope="col" tabulator-headerFilter="input">ID</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select=".//tei:place">
                                    <xsl:variable name="id">
                                        <xsl:value-of select="data(@xml:id)"/>
                                    </xsl:variable>
                                    <tr>
                                        <td>
                                            <a>
                                              <xsl:attribute name="href">
                                              <xsl:value-of select="concat($id, '.html')"/>
                                              </xsl:attribute>
                                              <i class="bi bi-link-45deg"/>
                                            </a>
                                        </td>
                                        <td>
                                            <xsl:value-of select="./tei:placeName[1]/text()"/>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="./tei:location[1]/tei:geo[1]">
                                                    <xsl:value-of select="tokenize(./tei:location[1]/tei:geo[1]/text(), ' ')[1]"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="./tei:location[1]/tei:geo[1]">
                                                    <xsl:value-of select="tokenize(./tei:location[1]/tei:geo[1]/text(), ' ')[last()]"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:value-of select="$id"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                        <xsl:call-template name="tabulator_dl_buttons"/>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
                <xsl:call-template name="tabulator_js"/>
            </body>
        </html>
        <xsl:for-each select=".//tei:place[@xml:id]">
            <xsl:variable name="filename" select="concat(./@xml:id, '.html')"/>
            <xsl:variable name="name" select="normalize-space(string-join(./tei:placeName[1]//text()))"></xsl:variable>
            <xsl:result-document href="{$filename}">
                <html {% if cookiecutter.translations == 'staticsearch' %} xmlns="http://www.w3.org/1999/xhtml" {% endif %} class="h-100">
                    <head>
                        <xsl:call-template name="html_head">
                            <xsl:with-param name="html_title" select="$name"></xsl:with-param>
                        </xsl:call-template>
                    </head>

                    <body class="d-flex flex-column h-100">
                        <xsl:call-template name="nav_bar"/>
                        <main>
                            <div class="container">
                                <h1>
                                    <xsl:value-of select="$name"/>
                                </h1>
                                <xsl:call-template name="place_detail"/>
                                <xsl:if test="./tei:location/tei:geo">
                                <div id="map_detail"/>
                                </xsl:if>
                            </div>
                        </main>
                        <xsl:call-template name="html_footer"/>
                        <xsl:if test="./tei:location/tei:geo">
                            <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
                                integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
                                crossorigin=""/>
                            <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
                                integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
                                crossorigin=""></script>
                            <script>
                                var lat = <xsl:value-of select="tokenize(./tei:location[1]/tei:geo[1]/text(), ' ')[1]"/>;
                                var long = <xsl:value-of select="tokenize(./tei:location[1]/tei:geo[1]/text(), ' ')[last()]"/>;
                                $("#map_detail").css("height", "500px");
                                var map = L.map('map_detail').setView([Number(lat), Number(long)], 13);
                                L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                maxZoom: 19,
                                attribution: '&amp;copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                                }).addTo(map);
                                var marker = L.marker([Number(lat), Number(long)]).addTo(map);
                            </script>
                        </xsl:if>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>