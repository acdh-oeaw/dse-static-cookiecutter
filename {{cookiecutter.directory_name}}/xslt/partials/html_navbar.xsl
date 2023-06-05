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
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__project" {% endif %}>{% if cookiecutter.translations == 'no' %}Projekt{% endif %}</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="about.html" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__about" {% endif %}>{% if cookiecutter.translations == 'no' %}Über das Projekt{% endif %}</a>
                                    </li>
                                </ul>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__toc" {% endif %}>{% if cookiecutter.translations == 'no' %}Editionseinheiten{% endif %}</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="toc.html" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__nofacs"  {% endif %}>{% if cookiecutter.translations == 'no' %}Mit Faks{% endif %}</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="toc_facs.html" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__withfacs" title="Mit Faksimiles" {% endif %}>{% if cookiecutter.translations == 'no' %}Ohne Faks{% endif %}</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown disabled">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__register" {% endif %}>{% if cookiecutter.translations == 'no' %}Register{% endif %}</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="listperson.html" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__persons"  {% endif %}>{% if cookiecutter.translations == 'no' %}Personen{% endif %}</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="listplace.html" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__places" {% endif %}>{% if cookiecutter.translations == 'no' %}Orte{% endif %}</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="listorg.html" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__orgs" {% endif %}>{% if cookiecutter.translations == 'no' %}Institutionen{% endif %}</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="listbibl.html" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__works" {% endif %}>{% if cookiecutter.translations == 'no' %}Werke{% endif %}</a>
                                    </li>
                                </ul>
                            </li>
                            
                            <li class="nav-item">
                                <a title="Suche" class="nav-link" href="search.html" {% if cookiecutter.translations == 'yes' %} data-i18n="navbar__search" {% endif %}>{% if cookiecutter.translations == 'no' %}Suche{% endif %}</a>
                            </li>{% if cookiecutter.translations == 'yes' %}
                            <select name="language" id="languageSwitcher"></select>{% endif %}
                        </ul>
                    </div>
                </div>
            </nav>
            
            <!-- .site-navigation -->
        </div>
    </xsl:template>
</xsl:stylesheet>