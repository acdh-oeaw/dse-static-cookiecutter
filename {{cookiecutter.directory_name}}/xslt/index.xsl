<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select="{{ cookiecutter.title_xpath }}"/>
        </xsl:variable>

        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>            
            <body class="page" style="background-color:#f1f1f1;">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>

                    <div class="container">
                        <div class="row intro">
                            <div class="col-md-6 wp-intro_left">
                                <div class="intro_left">
                                    <h1>Scholarly Digital Edition</h1>
                                    <h5>Eine Vorlage für statische Wepp-App Entwicklung</h5>
                                    <a href="toc.html" title="Edition ohne Faksimiles">
                                        <button class="btn btn-secondary" role="button" style="width: 200px;">
                                            Edition ohne Faksimiles
                                        </button>
                                    </a>
                                    <a href="toc_facs.html" title="Edition mit Faksimiles">
                                        <button class="btn btn-secondary" role="button" style="width: 200px;">
                                            Edition mit Faksimiles
                                        </button>
                                    </a>
                                    <a href="toc_pag.html" title="Edition mit Paginaton">
                                        <button class="btn btn-secondary" role="button" style="width: 200px;">
                                            Edition mit Paginaton
                                        </button>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="intro_right">
                                    <div class="wrapper" id="wrapper-hero-content" >
                                        <div class="hero-dark" id="wrapper-hero-inner" tabindex="-1">
                                            <div id="sampleIndexCarousel" class="carousel slide">
                                                <div class="carousel-indicators">
                                                    <button type="button" data-bs-target="#sampleIndexCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                                    <button type="button" data-bs-target="#sampleIndexCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                                    <button type="button" data-bs-target="#sampleIndexCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                                </div>
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active">
                                                        <img src="images/acdh_building.jpg" class="d-block w-100" alt="..."/>
                                                        <div class="carousel-caption d-none d-md-block" style="background-image: linear-gradient(rgba(38.0, 35.3, 37.6, 0.5), rgba(38.0, 35.3, 37.6, 0.5));">
                                                            <h1>Example Content Slide 1</h1>
                                                            <h2>Example Subtitle Slide 1</h2>
                                                            <h5>Second slide label</h5>
                                                            <p>Some representative placeholder content for the second slide.</p>
                                                        </div>
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img src="images/acdh_building.jpg" class="d-block w-100" alt="..."/>
                                                        <div class="carousel-caption d-none d-md-block" style="background-image: linear-gradient(rgba(38.0, 35.3, 37.6, 0.5), rgba(38.0, 35.3, 37.6, 0.5));">
                                                            <h1>Example Content Slide 2</h1>
                                                            <h2>Example Subtitle Slide 2</h2>
                                                            <h5>Second slide label</h5>
                                                            <p>Some representative placeholder content for the second slide.</p>
                                                        </div>
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img src="images/acdh_building.jpg" class="d-block w-100" alt="..."/>
                                                        <div class="carousel-caption d-none d-md-block" style="background-image: linear-gradient(rgba(38.0, 35.3, 37.6, 0.5), rgba(38.0, 35.3, 37.6, 0.5));">
                                                            <h1>Example Content Slide 3</h1>
                                                            <h2>Example Subtitle Slide 3</h2>
                                                            <h5>Third slide label</h5>
                                                            <p>Some representative placeholder content for the third slide.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="carousel-control-prev" type="button" data-bs-target="#sampleIndexCarousel" data-bs-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Previous</span>
                                                </button>
                                                <button class="carousel-control-next" type="button" data-bs-target="#sampleIndexCarousel" data-bs-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Next</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid" style="margin:2em auto;">
                            <div class="row">
                                <div class="col-md-4">
                                    <a href="toc.html" class="index-link">                                   
                                        <div class="card index-card">
                                            <div class="card-body">
                                                <img src="images/example-img-1.jpg" class="d-block w-100" alt="..."/>
                                            </div>
                                            <div class="card-header">                                            
                                                <p>
                                                    Vorlage für eine Edition ohne Faksimiles
                                                </p>                                            
                                            </div>
                                        </div>                                     
                                    </a>                                    
                                </div>
                                <div class="col-md-4">
                                    <a href="toc_facs.html" class="index-link">                                                     
                                        <div class="card index-card">
                                            <div class="card-body">
                                                <img src="images/example-img-2.jpg" class="d-block w-100" alt="..."/>
                                            </div>
                                            <div class="card-header">                                            
                                                <p>
                                                    Vorlage für eine Edition mit Faksimiles
                                                </p>                                            
                                            </div>
                                        </div>                                 
                                    </a>
                                </div>
                                <div class="col-md-4">
                                    <a href="toc_pag.html" class="index-link">  
                                        <div class="card index-card">
                                            <div class="card-body">
                                                <img src="images/example-img-2.jpg" class="d-block w-100" alt="..."/>
                                            </div>
                                            <div class="card-header">                                            
                                                <p>
                                                    Vorlage für eine Edition mit Pagination
                                                </p>                                            
                                            </div>
                                        </div>                                    
                                    </a>
                                </div>
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