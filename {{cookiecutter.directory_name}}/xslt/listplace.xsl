<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:import href="partials/html_navbar.xsl"/>
    <xsl:import href="partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/place.xsl"/>
    
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:titleStmt/tei:title[1]/text()"/>
        </xsl:variable>
        <html class="h-100" lang="{$default_lang}">
            
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                <link href="vendor/tabulator-tables/css/tabulator_bootstrap5.min.css" rel="stylesheet"/>
            <link rel="stylesheet" href="vendor/leaflet/leaflet.css"/>
            <script src="vendor/leaflet/leaflet.js"/>
            <link rel="stylesheet"
                href="vendor/leaflet.markercluster/MarkerCluster.css"/>
            <link rel="stylesheet"
                href="vendor/leaflet.markercluster/MarkerCluster.Default.css"/>
            <script src="vendor/leaflet.markercluster/leaflet.markercluster.js"/>
            </head>
            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0 flex-grow-1">
                    <div class="container">
                        <h1><xsl:value-of select="$doc_title"/></h1>
                        <div id="map"/>
                        <table id="placesTable">
                            <thead>
                                <tr>
                                    <th scope="col">Ortsname</th>
                                    <th scope="col">Erwähnungen</th>
                                    <th scope="col">lat</th>
                                    <th scope="col">lng</th>
                                    <th scope="col">linkToEntity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select=".//tei:place[@xml:id]">
                                    <xsl:variable name="id">
                                        <xsl:value-of select="data(@xml:id)"/>
                                    </xsl:variable>
                                    <tr>
                                        <td>
                                            <xsl:value-of select="./tei:placeName[1]/text()"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="count(.//tei:note[@type='mentions'])"/>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="./tei:location/tei:geo">
                                                    <xsl:value-of select="replace(tokenize(./tei:location[1]/tei:geo/text(), ' ')[1], ',', '.')"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="./tei:location/tei:geo">
                                                    <xsl:value-of select="replace(tokenize(./tei:location[1]/tei:geo/text(), ' ')[last()], ',', '.')"/>
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
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
                <script type="text/javascript" src="vendor/tabulator-tables/js/tabulator.min.js"/>
                <script src="js/map_table_cfg.js"/>
                <script src="js/make_map_and_table.js"/>
                
                <script>
                    build_map_and_table(map_cfg, table_cfg, wms_cfg=null, tms_cfg=tms_cfg);
                </script>
            </body>
        </html>
        <xsl:for-each select=".//tei:place[@xml:id]">
            <xsl:variable name="filename" select="concat(./@xml:id, '.html')"/>
            <xsl:variable name="name" select="normalize-space(string-join(./tei:placeName[1]//text()))"></xsl:variable>
            <xsl:result-document href="{$filename}">
                <html class="h-100" lang="{$default_lang}">
                    <head>
                        <xsl:call-template name="html_head">
                            <xsl:with-param name="html_title" select="$name"></xsl:with-param>
                        </xsl:call-template>
                    </head>

                    <body class="d-flex flex-column h-100">
                        <xsl:call-template name="nav_bar"/>
                        <main class="flex-shrink-0 flex-grow-1">
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
                            <link rel="stylesheet" href="vendor/leaflet/leaflet.css"/>
                            <script src="vendor/leaflet/leaflet.js"></script>
                            <script>
                                var lat = <xsl:value-of select="replace(tokenize(./tei:location[1]/tei:geo[1]/text(), ' ')[1], ',', '.')"/>;
                                var long = <xsl:value-of select="replace(tokenize(./tei:location[1]/tei:geo[1]/text(), ' ')[2], ',', '.')"/>;
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