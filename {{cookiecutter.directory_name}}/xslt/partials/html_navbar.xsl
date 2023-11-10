<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="/" name="nav_bar">
        <header>
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.html">
                        <xsl:value-of select="$project_short_title"/>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-i18n="navbar__project"/>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="about.html" data-i18n="navbar__about"/>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="imprint.html" data-i18n="navbar__imprint"/>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="toc.html" data-i18n="navbar__nofacs"/>
                            </li>

                            <li class="nav-item dropdown disabled">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-i18n="navbar__register"/>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="listperson.html" data-i18n="navbar__persons"/>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="listplace.html" data-i18n="navbar__places"/>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="listorg.html" data-i18n="navbar__orgs"/>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="listbibl.html" data-i18n="navbar__works"/>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a title="Suche" class="nav-link" href="search.html" data-i18n="navbar__search"/>
                            </li>
                            
                            <select name="language" id="languageSwitcher"/>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
    </xsl:template>
</xsl:stylesheet>