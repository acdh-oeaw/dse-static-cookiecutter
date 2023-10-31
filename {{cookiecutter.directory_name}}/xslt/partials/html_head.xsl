<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:include href="./params.xsl"/>
    <xsl:template match="/" name="html_head">
        <xsl:param name="html_title" select="$project_short_title"></xsl:param>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-title" content="{$html_title}" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="{$project_logo}" />
    <!-- favicon -->
        <!-- <link rel="None" type="image/ico" href="images/favicons/favicon.ico" />
        <link rel="icon" type="image/png" href="images/favicons/favicon-16x16.png" />
        <link rel="icon" type="image/png" href="images/favicons/favicon-32x32.png" />
        <link rel="icon" type="image/png" href="images/favicons/favicon-64x64.png" />
        <link rel="icon" type="image/png" href="images/favicons/favicon-96x96.png" />
        <link rel="icon" type="image/png" href="images/favicons/favicon-180x180.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-57x57.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-60x60.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-72x72.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-76x76.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-114x114.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-120x120.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-144x144.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-152x152.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-167x167.png" />
        <link rel="apple-touch-icon" type="image/png" href="images/favicons/apple-touch-icon-180x180.png" />
        <link rel="None" type="image/png" href="images/favicons/mstile-70x70.png" />
        <link rel="None" type="image/png" href="images/favicons/mstile-270x270.png" />
        <link rel="None" type="image/png" href="images/favicons/mstile-310x310.png" />
        <link rel="None" type="image/png" href="images/favicons/mstile-310x150.png" />
        <link rel="shortcut icon" type="image/png" href="images/favicons/favicon-196x196.png" /> -->
    <!-- favicon end -->
        <link rel="icon" type="image/svg+xml" href="{$project_logo}" sizes="any" />
        <link rel="profile" href="http://gmpg.org/xfn/11"></link>
        <title><xsl:value-of select="$html_title"/></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"/>
        <link rel="stylesheet" href="css/style.css" type="text/css"></link>
        <link rel="stylesheet" href="css/micro-editor.css" type="text/css"></link>{% if cookiecutter.translations == 'yes' %}
        <script src="https://cdn.jsdelivr.net/npm/i18next@21.6.10/i18next.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-i18next@1.2.1/jquery-i18next.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/i18next-browser-languagedetector@6.1.3/i18nextBrowserLanguageDetector.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/i18next-http-backend@1.3.2/i18nextHttpBackend.min.js"></script>{% endif %}
    </xsl:template>
</xsl:stylesheet>