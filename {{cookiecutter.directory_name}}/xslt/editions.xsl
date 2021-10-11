<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/osd-container.xsl"/>
    <xsl:import href="partials/tei-facsimile.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type='main'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">                        
                        <div class="card">
                            <div class="card-header">
                                <h1><xsl:value-of select="$doc_title"/></h1>
                            </div>
                            <div class="card-body">                                
                                <xsl:for-each select="//tei:div[@xml:id='transcription']">
                                    <xsl:for-each-group select="*" group-starting-with="tei:pb">
                                        <div class="transcript row">
                                            <div class="col-md-6">     
                                                <hr/>                                                
                                                <div class="card-body">                                                                                       
                                                    <xsl:for-each select="current-group()[self::tei:p]">
                                                        <p><xsl:apply-templates/></p>
                                                    </xsl:for-each>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <hr/>                                                
                                                <div class="card-body">
                                                    <xsl:variable name="osd_container_id" select="concat(@type, '_container_', generate-id())"/>
                                                    <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', generate-id())"/>
                                                    <div id="{$osd_container_id}" style="padding:.5em;">
                                                        <!-- image container accessed by OSD script -->
                                                        <script type="text/javascript" src="js/osd_single.js"></script>
                                                        <div id="{$osd_container_id2}">
                                                            <xsl:if test="@facs">    
                                                                <xsl:variable name="iiif-ext" select="'full/full/0/default.jpg'"/> 
                                                                <xsl:variable name="facs_id" select="concat(@type, '_img_', generate-id())"/>
                                                                <img id="{$facs_id}" onload="load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}')">
                                                                    <xsl:attribute name="src">
                                                                        <xsl:value-of select="concat(@facs , $iiif-ext)"/>
                                                                    </xsl:attribute>
                                                                </img>                                                                
                                                            </xsl:if>                                
                                                        </div>                                
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </xsl:for-each-group>
                                    
                                </xsl:for-each>
                            </div>
                        </div>                       
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
                    
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    <xsl:template match="tei:unclear">
        <abbr title="unclear"><xsl:apply-templates/></abbr>
    </xsl:template>
    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>    
</xsl:stylesheet>