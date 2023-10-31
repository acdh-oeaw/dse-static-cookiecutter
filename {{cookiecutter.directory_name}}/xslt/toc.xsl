<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">
    {% if cookiecutter.search_engine == 'staticsearch' %}
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    {% else %}
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>
    {% endif %}
    
    <xsl:import href="partials/html_navbar.xsl"/>
    <xsl:import href="partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/tabulator.xsl"/>


    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Inhaltsverzeichnis'"/>


    {% if cookiecutter.search_engine == 'staticsearch' %}
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml" class="h-100">
    {% else %}
        <html class="h-100">
    {% endif %}
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            
            <body class="d-flex flex-column h-100">
            <xsl:call-template name="nav_bar"/>
                <main>
                    <div class="container">
                        <h1>Inhaltsverzeichnis</h1>
                        <table class="table" id="myTable">
                            <thead>
                                <tr>
                                    <th scope="col" width="20" tabulator-formatter="html" tabulator-headerSort="false" tabulator-download="false">#</th>
                                    <th scope="col" tabulator-headerFilter="input">Titel</th>
                                    <th scope="col" tabulator-headerFilter="input">Dateinname</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each
                                    select="collection('../data/editions?select=*.xml')//tei:TEI">
                                    <xsl:variable name="full_path">
                                        <xsl:value-of select="document-uri(/)"/>
                                    </xsl:variable>
                                    <tr>
                                        <td>
                                            <a>
                                                <xsl:attribute name="href">
                                                  <xsl:value-of
                                                  select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"
                                                  />
                                                </xsl:attribute>
                                                <i class="bi bi-link-45deg"/>
                                            </a>
                                        </td>
                                        <td>
                                            <xsl:value-of
                                                select=".//tei:titleStmt/tei:title[1]/text()"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="tokenize($full_path, '/')[last()]"
                                            />
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                        <h4>Download Table</h4>
                        <div class="button-group">
                            <button type="button" class="btn btn-outline-secondary" id="download-csv" title="Download CSV">
                                <i class="bi bi-filetype-csv"></i>
                                <span class="visually-hidden">Download CSV</span>
                            </button>
                            <button type="button" class="btn btn-outline-secondary" id="download-json" title="Download JSON">
                                <i class="bi bi-filetype-json"></i>
                                <span class="visually-hidden">Download JSON</span>
                            </button>
                            <button type="button" class="btn btn-outline-secondary" id="download-html" title="Download HTML">
                                <i class="bi bi-filetype-html"></i>
                                <span class="visually-hidden">Download HTML</span>
                            </button>
                        </div>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
                <xsl:call-template name="tabulator"/>
                <script src="tabulator-js/config.js"></script>
                <script>
                    var table = new Tabulator("#myTable", config);
                    //trigger download of data.csv file
                    document.getElementById("download-csv").addEventListener("click", function(){
                    table.download("csv", "data.csv");
                    });
                    
                    //trigger download of data.json file
                    document.getElementById("download-json").addEventListener("click", function(){
                    table.download("json", "data.json");
                    });
                    
                    //trigger download of data.html file
                    document.getElementById("download-html").addEventListener("click", function(){
                    table.download("html", "data.html", {style:true});
                    });
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>