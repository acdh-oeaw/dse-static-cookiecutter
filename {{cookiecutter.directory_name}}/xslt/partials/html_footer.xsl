<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="/" name="html_footer">
        <footer class="footer mt-auto py-3 bg-body-tertiary">
            <div class="float-end me-3">
                <a href="{$github_url}"><i class="bi bi-github"></i></a>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="js/navScroll.js"></script>{% if cookiecutter.darkmode == 'yes' %}
        <script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script>
        <script>
            function addDarkmodeWidget() {
                new Darkmode().showWidget();
            }
            window.addEventListener('load', addDarkmodeWidget);
        </script>
        {% endif %}
        {% if cookiecutter.translations == 'yes' %}
        <script src="js/i18n.js"></script>
        {% endif %}
    </xsl:template>
</xsl:stylesheet>