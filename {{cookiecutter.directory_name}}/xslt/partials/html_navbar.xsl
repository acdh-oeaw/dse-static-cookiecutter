<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="/" name="nav_bar">
        <div class="wrapper-fluid wrapper-navbar sticky-top hide-reading" id="wrapper-navbar">
            <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <!-- Your site title as branding in the menu -->
                    <a href="index.html" class="navbar-brand custom-logo-link" rel="home" itemprop="url"><img src="{$project_logo}" class="img-fluid" title="{$project_short_title}" alt="{$project_short_title}" itemprop="logo" /></a><!-- end custom logo -->
                    <!--<a class="navbar-brand site-title-with-logo" rel="home" href="index.html" title="{$project_short_title}" itemprop="url"><xsl:value-of select="$project_short_title"/></a>-->
                    <span class="badge bg-light text-dark">in development</span>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-i18n="navbar.project"/>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="about.html" data-i18n="navbar.about"/>
                                    </li>
                                </ul>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-i18n="navbar.toc"/>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="toc.html" data-i18n="navbar.nofacs" />
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="toc_facs.html" data-i18n="navbar.withfacs" title="Mit Faksimiles"/>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown disabled">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-i18n="navbar.register"/>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="listperson.html" data-i18n="navbar.persons" />
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="listplace.html" data-i18n="navbar.places"/>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="listorg.html" data-i18n="navbar.orgs"/>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="listbibl.html" data-i18n="navbar.works"/>
                                    </li>
                                </ul>
                            </li>
                            
                            <li class="nav-item">
                                <a title="Suche" class="nav-link" href="search.html" data-i18n="navbar.search"/>
                            </li>
                            <select name="language" id="languageSwitcher"></select>
                        </ul>
                    </div>
                </div>
            </nav>
            
            <!-- .site-navigation -->
        </div>
    </xsl:template>
</xsl:stylesheet>