<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./partials/place.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type='main'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">                        
                        <div class="card">
                            <div class="card-header">
                                <h1><xsl:value-of select="$doc_title"/></h1>
                            </div>
                            <div class="card-body">           
                                <div id="map"/>
                                <table class="table table-striped display" id="myTable" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th scope="col">Ortsname</th>
                                            <th scope="col">Lat</th>
                                            <th scope="col">Long</th>
                                            <th scope="col">ID</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:for-each select=".//tei:place">
                                            <xsl:variable name="id">
                                                <xsl:value-of select="data(@xml:id)"/>
                                            </xsl:variable>
                                            <tr>
                                                <td>
                                                    <a href="{concat($id, '.html')}"><xsl:value-of select=".//tei:placeName[1]/text()"/></a>
                                                </td>
                                                <td>
                                                    <xsl:choose>
                                                        <xsl:when test="./tei:location/tei:geo">
                                                            <xsl:value-of select="tokenize(./tei:location/tei:geo/text(), ' ')[1]"/>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </td>
                                                <td>
                                                    <xsl:choose>
                                                        <xsl:when test="./tei:location/tei:geo">
                                                            <xsl:value-of select="tokenize(./tei:location/tei:geo/text(), ' ')[last()]"/>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </td>
                                                <td>
                                                    <a>
                                                        <xsl:attribute name="href">
                                                            <xsl:value-of select="concat($id, '.html')"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select="$id"/>
                                                    </a> 
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </div>
                        </div>                       
                    </div>
                    <xsl:call-template name="html_footer"/>
                    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
                        integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
                        crossorigin=""/>
                    <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css"/>
                    <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css"/>
                    <!-- ############### leaflet script ################ -->
                    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                        integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                        crossorigin=""></script>
                    <script src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js"></script>
                    <link href="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.13.4/b-2.3.6/b-colvis-2.3.6/b-html5-2.3.6/b-print-2.3.6/r-2.4.1/datatables.min.css" rel="stylesheet"/>
                    
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
                    <script src="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.13.4/b-2.3.6/b-colvis-2.3.6/b-html5-2.3.6/b-print-2.3.6/r-2.4.1/datatables.min.js"></script>
                    <script src="js/dt_map.js"></script>
                </div>
            </body>
        </html>
        <xsl:for-each select=".//tei:place">
            <xsl:variable name="filename" select="concat(./@xml:id, '.html')"/>
            <xsl:variable name="name" select="./tei:placeName[1]/text()"></xsl:variable>
            <xsl:result-document href="{$filename}">
                <html xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:call-template name="html_head">
                        <xsl:with-param name="html_title" select="$name"></xsl:with-param>
                    </xsl:call-template>
                    
                    <body class="page">
                        <div class="hfeed site" id="page">
                            <xsl:call-template name="nav_bar"/>
                            
                            <div class="container-fluid">
                                <div class="card">
                                    <div class="card-header">
                                        <h1>
                                            <xsl:value-of select="$name"/>
                                        </h1>
                                    </div>
                                    <div class="card-body">
                                        <xsl:call-template name="place_detail"/>
                                        <xsl:if test="./tei:location/tei:geo">
                                        <div id="map_detail"/>
                                        </xsl:if>
                                    </div>
                                </div>
                            </div>
                            
                            <xsl:call-template name="html_footer"/>
                        </div>
                        <xsl:if test="./tei:location/tei:geo">
                            <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
                                integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
                                crossorigin=""/>
                            <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
                                integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
                                crossorigin=""></script>
                            <script>
                                var lat = <xsl:value-of select="tokenize(.//tei:geo[1]/text(), ' ')[1]"/>;
                                var long = <xsl:value-of select="tokenize(.//tei:geo[1]/text(), ' ')[last()]"/>;
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