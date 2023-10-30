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
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Volltextsuche'"/>
        <html {% if cookiecutter.search_engine == 'staticsearch' %} xmlns="http://www.w3.org/1999/xhtml" {% endif %} class="h-100">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                    <div class="container">
                        <h1>
                            <xsl:value-of select="$doc_title"/>
                        </h1>
                        {% if cookiecutter.search_engine == 'staticsearch' %}
                        <div id="staticSearch"/>
                        {% endif %}                    
                    </div>
                    <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>