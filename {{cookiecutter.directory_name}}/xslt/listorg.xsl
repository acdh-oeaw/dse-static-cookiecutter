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
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./partials/org.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:titleStmt/tei:title[1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html {% if cookiecutter.search_engine == 'staticsearch' %} xmlns="http://www.w3.org/1999/xhtml" {% endif %} class="h-100">

            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                    <main>
                        <div class="container">                        
                            <h1>
                                <xsl:value-of select="$doc_title"/>
                            </h1>
                            
                            <table class="table" id="myTable">
                                <thead>
                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col">ID</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select=".//tei:org">
                                        <xsl:variable name="id">
                                            <xsl:value-of select="data(@xml:id)"/>
                                        </xsl:variable>
                                        <tr>
                                            <td>
                                                <xsl:value-of select=".//tei:orgName[1]/text()"/>
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
                    </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
        <xsl:for-each select=".//tei:org">
            <xsl:variable name="filename" select="concat(./@xml:id, '.html')"/>
            <xsl:variable name="name" select="normalize-space(string-join(./tei:orgName[1]//text()))"></xsl:variable>
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
                                <xsl:call-template name="org_detail"/>  
                            </div>
                        </main>
                        <xsl:call-template name="html_footer"/>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>