<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:template name="osd-container">
        <div id="OSD-images" style="padding:.5em;">
            <!-- image container accessed by OSD script -->
            <div id="non-OSD-images">
                <!-- #non-OSD-images is removed with openSeaDragon script -->
                <!-- if no script is available it holds the images from tei/xml -->
                <xsl:apply-templates select="//tei:facsimile"/>                                  
            </div>                                
        </div>
    </xsl:template>
</xsl:stylesheet>