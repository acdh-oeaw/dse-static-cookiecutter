<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:param name="directory_name">{{ cookiecutter.directory_name }}</xsl:param>
    <xsl:param name="project_title">{{ cookiecutter.project_title }}</xsl:param>
    <xsl:param name="redmine_id">{{ cookiecutter.redmine_id }}</xsl:param>
    <xsl:param name="project_short_title">{{ cookiecutter.project_short_title }}</xsl:param>
    <xsl:param name="default_lang">{{ cookiecutter.default_lang }}</xsl:param>
    <xsl:param name="github_url">{{ cookiecutter.github_url }}</xsl:param>
    <xsl:param name="html_title">{{ cookiecutter.project_short_title }}</xsl:param>
    <xsl:param name="project_logo">images/logo.png</xsl:param>
    <xsl:param name="base_url">{{ cookiecutter.base_url }}</xsl:param>{% if cookiecutter.data_dir %}
    <xsl:param name="data_repo">{{ cookiecutter.data_repo }}</xsl:param>{% endif %}
</xsl:stylesheet>