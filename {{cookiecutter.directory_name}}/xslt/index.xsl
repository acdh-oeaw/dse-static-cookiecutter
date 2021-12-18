<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type='main'][1]/text()"/>
        </xsl:variable>

        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                
                    <div class="wrapper" id="wrapper-hero">
                        <!--<div class="wrapper" id="wrapper-hero-content" >
                            <div class="container hero-dark" id="wrapper-hero-inner" tabindex="-1">-->
                                <div id="audenIndexCarousel" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#audenIndexCarousel" data-slide-to="0" class="active"></li>
                                        <li data-target="#audenIndexCarousel" data-slide-to="1"></li>
                                        <li data-target="#audenIndexCarousel" data-slide-to="2"></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="dist/fundament/images/acdh_building.jpg" class="d-block w-100" alt="..."/>
                                            <div class="carousel-caption d-none d-md-block" style="background-image: linear-gradient(rgba(38.0, 35.3, 37.6, 0.5), rgba(38.0, 35.3, 37.6, 0.5));">
                                                <h1><xsl:value-of select="$project_short_title"/></h1>
                                                <h2><xsl:value-of select="$project_title"/></h2>
                                                <p>Some teaser text for the <strong><xsl:value-of select="$project_short_title"/></strong></p>
                                                <button class="btn btn-round">
                                                    <a href="toc.html">Read More</a>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img src="dist/fundament/images/acdh_building.jpg" class="d-block w-100" alt="..."/>
                                            <div class="carousel-caption d-none d-md-block" style="background-image: linear-gradient(rgba(38.0, 35.3, 37.6, 0.5), rgba(38.0, 35.3, 37.6, 0.5));">
                                                <h1>Example Content Slide 2</h1>
                                                <h2>Example Subtitle Slide 2</h2>
                                                <h5>Second slide label</h5>
                                                <p>Some representative placeholder content for the second slide.</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img src="dist/fundament/images/acdh_building.jpg" class="d-block w-100" alt="..."/>
                                            <div class="carousel-caption d-none d-md-block" style="background-image: linear-gradient(rgba(38.0, 35.3, 37.6, 0.5), rgba(38.0, 35.3, 37.6, 0.5));">
                                                <h1>Example Content Slide 3</h1>
                                                <h2>Example Subtitle Slide 3</h2>
                                                <h5>Third slide label</h5>
                                                <p>Some representative placeholder content for the third slide.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <!--</div>
                        </div>-->                        
                    </div>
                    <div class="container" style="margin-top:1em;">
                        <div class="row">
                            <div class="col-md-8" style="margin: 0 auto; ">
                                <p style="font-size:18px;line-heigth:27px;"><xsl:value-of select="//tei:body/tei:div/tei:p"/></p>  
                            </div>                          
                        </div>
                    </div>
                    <div class="container" style="margin-top:1em;">
                        <div class="row">
                            <div class="col-md-4">
                                <a href="listperson.html" class="index-link">                                   
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img src="dist/fundament/images/example-img-1.jpg" class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">                                            
                                            <h3>
                                                <i class="fas fa-user-friends"></i> Personenregister
                                            </h3>                                            
                                        </div>
                                    </div>                                     
                                </a>                                    
                            </div>
                            <div class="col-md-4">
                                <a href="listplace.html" class="index-link">                                   
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img src="dist/fundament/images/example-img-2.jpg" class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">                                            
                                            <h3>
                                                <i class="fas fa-map-marker-alt"></i> Ortsregister
                                            </h3>                                            
                                        </div>
                                    </div>                                     
                                </a>                                    
                            </div>
                            <div class="col-md-4">
                                <a href="listorg.html" class="index-link">                                   
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img src="dist/fundament/images/example-img-1.jpg" class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">                                            
                                            <h3>
                                                <i class="fas fa-university"></i>  Institutionenregister
                                            </h3>                                            
                                        </div>
                                    </div>                                     
                                </a>                                    
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}"><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p id="{generate-id()}"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul id="{generate-id()}"><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li id="{generate-id()}"><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>