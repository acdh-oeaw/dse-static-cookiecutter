<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/osd-container.xsl"/>
    <xsl:import href="partials/tei-facsimile.xsl"/>
    <xsl:import href="partials/aot-options.xsl"/>

    <xsl:variable name="prev">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@prev), '/')[last()], '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="next">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@next), '/')[last()], '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="teiSource">
        <xsl:value-of select="data(tei:TEI/@xml:id)"/>
    </xsl:variable>
    <xsl:variable name="link">
        <xsl:value-of select="replace($teiSource, '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="doc_title">
        <xsl:value-of select=".//tei:title[@type='label'][1]/text()"/>
    </xsl:variable>

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
                        <div class="wp-transcript">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-2">
                                        <xsl:if test="ends-with($prev,'.html')">
                                            <h1>
                                                <a>
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="replace($prev, '.html', '_facsimile.html')"/>
                                                    </xsl:attribute>
                                                    <i class="fas fa-chevron-left" title="prev"/>
                                                </a>
                                            </h1>
                                        </xsl:if>
                                    </div>
                                    <div class="col-md-8">
                                        <h1 align="center">
                                            <xsl:value-of select="$doc_title"/>
                                        </h1>
                                        <h3 align="center">
                                            <a href="{$teiSource}">
                                                <i class="fas fa-download" title="show TEI source"/>
                                            </a>
                                        </h3>
                                    </div>
                                    <div class="col-md-2" style="text-align:right">
                                        <xsl:if test="ends-with($next, '.html')">
                                            <h1>
                                                <a>
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="replace($next, '.html', '_facsimile.html')"/>
                                                    </xsl:attribute>
                                                    <i class="fas fa-chevron-right" title="next"/>
                                                </a>
                                            </h1>
                                        </xsl:if>
                                    </div>
                                </div>
                                <div id="editor-widget">
                                    <p>Text Editor</p>
                                    <xsl:call-template name="annotation-options"></xsl:call-template>
                                </div>
                            </div>
                            <div id="container-resize" class="row transcript active">
                                <div id="img-resize" class="col-md-6 facsimiles">
                                    <div id="viewer">
                                        <div id="container_facs_1">
                                            <!-- container and facs handling in js -->
                                        </div>
                                    </div>
                                </div>
                                <div id="text-resize" class="col-md-6 text yes-index">
                                    <div id="section">
                                        <xsl:for-each select="//tei:body">
                                            <div class="card-body">
                                                <xsl:for-each-group select="*" group-starting-with="tei:pb">
                                                    <xsl:for-each select="current-group()[self::tei:p|self::tei:lg|self::tei:pb]">
                                                        <xsl:if test="name() = 'pb'">
                                                            <span class="anchor-pb"></span>
                                                            <span class="pb" source="{tokenize(@facs, '/')[last()]}"><xsl:value-of select="@n"/></span>
                                                        </xsl:if>
                                                        <p><xsl:apply-templates/></p>
                                                    </xsl:for-each>
                                                </xsl:for-each-group>
                                            </div>
                                            <xsl:if test="//tei:note[@type='footnote']">
                                                <div class="card-footer">
                                                    <a class="anchor" id="footnotes"></a>
                                                    <ul class="footnotes">
                                                        <xsl:for-each select="//tei:note[@place='foot']">
                                                            <li>
                                                                <a class="anchorFoot" id="{@xml:id}"></a>
                                                                <span class="footnote_link">
                                                                    <a href="#{@xml:id}_inline" class="nounderline">
                                                                        <xsl:value-of select="@n"/>
                                                                    </a>
                                                                </span>
                                                                <span class="footnote_text">
                                                                    <xsl:apply-templates/>
                                                                </span>
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </div>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </div>
                            <!-- create list* elements for entities bs-modal -->
                            <xsl:for-each select="//tei:back">
                                <div class="tei-back">
                                    <xsl:apply-templates/>
                                </div>
                            </xsl:for-each>
                        </div>                       
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
                <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
                <script src="https://unpkg.com/de-micro-editor@0.2.6/dist/de-editor.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/4.0.0/openseadragon.min.js"></script>
                <script type="text/javascript" src="js/osd_scroll.js"></script>
                <script type="text/javascript" src="js/run.js"></script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    <xsl:template match="tei:hi">
        <span>
            <xsl:choose>
                <xsl:when test="@rendition = '#em'">
                    <xsl:attribute name="class">
                        <xsl:text>italic</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@rendition = '#italic'">
                    <xsl:attribute name="class">
                        <xsl:text>italic</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@rendition = '#smallcaps'">
                    <xsl:attribute name="class">
                        <xsl:text>smallcaps</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@rendition = '#bold'">
                    <xsl:attribute name="class">
                        <xsl:text>bold</xsl:text>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:pb">
        <span class="anchor-pb"></span>
        <span class="pb" source="{tokenize(@facs, '/')[last()]}"><xsl:value-of select="@n"/></span>
    </xsl:template>
    <xsl:template match="tei:unclear">
        <abbr title="unclear"><xsl:apply-templates/></abbr>
    </xsl:template>
    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>
    <xsl:template match="tei:cit">
        <cite><xsl:apply-templates/></cite>
    </xsl:template>
    <xsl:template match="tei:quote">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:date">
        <span class="date"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="tei:list[@type='unordered']">
        <xsl:choose>
            <xsl:when test="ancestor::tei:body">
                <ul class="yes-index">
                    <xsl:apply-templates/>
                </ul>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:item">
        <xsl:choose>
            <xsl:when test="parent::tei:list[@type='unordered']|ancestor::tei:body">
                <li><xsl:apply-templates/></li>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:note">
        <xsl:choose>
            <xsl:when test="@place='foot'">
                <a class="anchorFoot" id="{@xml:id}_inline"></a>
                <a href="#{@xml:id}" title="Fußnote {@n}" class="nounderline">
                    <sup><xsl:value-of select="@n"/></sup>
                </a>
            </xsl:when>
            <xsl:when test="@place='end'">
                <a class="anchorFoot" id="{@xml:id}_inline"></a>
                <a href="#{@xml:id}" title="Fußnote {@n}" class="nounderline">
                    <sup><xsl:value-of select="@n"/></sup>
                </a>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:ref">
        <a class="ref {@type}" href="{@target}"><xsl:apply-templates/></a>
    </xsl:template>
    <xsl:template match="tei:lg">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:l">
        <xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="tei:p">
       <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:rs">
        <xsl:choose>
            <xsl:when test="count(tokenize(@ref, ' ')) > 1">
                <xsl:choose>
                    <xsl:when test="@type='person'">
                        <span class="persons {substring-after(@rendition, '#')}" id="{@xml:id}">
                            <xsl:apply-templates/>
                            <xsl:for-each select="tokenize(@ref, ' ')">
                                <sup class="entity" data-bs-toggle="modal" data-bs-target="{.}">
                                    <xsl:value-of select="position()"/>
                                </sup>
                                <xsl:if test="position() != last()">
                                    <sup class="entity">/</sup>
                                </xsl:if>
                            </xsl:for-each>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='place'">
                        <span class="places {substring-after(@rendition, '#')}" id="{@xml:id}">
                            <xsl:apply-templates/>
                            <xsl:for-each select="tokenize(@ref, ' ')">
                                <sup class="entity" data-bs-toggle="modal" data-bs-target="{.}">
                                    <xsl:value-of select="position()"/>
                                </sup>
                                <xsl:if test="position() != last()">
                                    <sup class="entity">/</sup>
                                </xsl:if>
                            </xsl:for-each>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='bibl'">
                        <span class="works {substring-after(@rendition, '#')}" id="{@xml:id}">
                            <xsl:apply-templates/>
                            <xsl:for-each select="tokenize(@ref, ' ')">
                                <sup class="entity" data-bs-toggle="modal" data-bs-target="{.}">
                                    <xsl:value-of select="position()"/>
                                </sup>
                                <xsl:if test="position() != last()">
                                    <sup class="entity">/</sup>
                                </xsl:if>
                            </xsl:for-each>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='org'">
                        <span class="orgs {substring-after(@rendition, '#')}" id="{@xml:id}">
                            <xsl:apply-templates/>
                            <xsl:for-each select="tokenize(@ref, ' ')">
                                <sup class="entity" data-bs-toggle="modal" data-bs-target="{.}">
                                    <xsl:value-of select="position()"/>
                                </sup>
                                <xsl:if test="position() != last()">
                                    <sup class="entity">/</sup>
                                </xsl:if>
                            </xsl:for-each>
                        </span>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@type='person'">
                        <span class="persons entity {substring-after(@rendition, '#')}" id="{@xml:id}" data-bs-toggle="modal" data-bs-target="{@ref}">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='place'">
                        <span class="places entity {substring-after(@rendition, '#')}" id="{@xml:id}" data-bs-toggle="modal" data-bs-target="{@ref}">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='bibl'">
                        <span class="works entity {substring-after(@rendition, '#')}" id="{@xml:id}" data-bs-toggle="modal" data-bs-target="{@ref}">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='org'">
                        <span class="orgs entity {substring-after(@rendition, '#')}" id="{@xml:id}" data-bs-toggle="modal" data-bs-target="{@ref}">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:listPerson">
        <xsl:for-each select="./tei:person">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{concat(./tei:persName/tei:surname, ', ', ./tei:persName/tei:forename)}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="concat(./tei:persName/tei:surname, ', ', ./tei:persName/tei:forename)"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th>
                                            GND
                                        </th>
                                        <td>
                                            <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                <xsl:value-of select="./tei:idno[@type='GND']"/>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Details
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listPlace">
        <xsl:for-each select="./tei:place">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{if(./tei:settlement) then(./tei:settlement/tei:placeName) else (./tei:placeName)}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="if(./tei:settlement) then(./tei:settlement/tei:placeName) else (./tei:placeName)"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th>
                                            Land
                                        </th>
                                        <td>
                                            <xsl:value-of select="./tei:country"/>
                                        </td>
                                    </tr>
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
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Details
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listOrg">
        <xsl:for-each select="./tei:org">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{if(./tei:settlement) then(./tei:settlement/tei:placeName) else (./tei:placeName)}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="if(./tei:settlement) then(./tei:settlement/tei:placeName) else (./tei:placeName)"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tbody>
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
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Details
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listBibl">
        <xsl:for-each select="./tei:bibl">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{./tei:title[@type='main']}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="./tei:title"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tbody>
                                    
                                    <tr>
                                        <th>
                                            Autor(en)
                                        </th>
                                        <td>
                                            <ul>
                                                <xsl:for-each select="./tei:author">
                                                    <li>
                                                        <a href="{@xml:id}.html">
                                                            <xsl:value-of select="./tei:persName"/>
                                                        </a>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </td>
                                    </tr>
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
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Details
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>