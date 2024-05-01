import os
import shutil


if "{{ cookiecutter.translations }}" == "no":
    os.remove("make_translations.py")
    os.remove("translations.csv")
    os.remove(os.path.join("html", "js", "i18n.js"))
    shutil.rmtree(os.path.join("html", "locales"))
    os.replace(
        os.path.join("xslt", "partials", "html_navbar_no_translations.xsl"),
        os.path.join("xslt", "partials", "html_navbar.xsl"),
    )

{% if cookiecutter.use_remote_data -%}
shutil.rmtree(os.path.join("data", "editions"), ignore_errors=True)
{% else %}
os.remove("fetch_data.sh")
{% endif %}
    