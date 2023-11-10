import os
import shutil


if "{{ cookiecutter.update_favicons }}" == "yes":
    print("you can run `python update_favicons.py")
else:
    os.remove("update_favicons.py")

if "{{ cookiecutter.search_engine }}" == "typesense":
    print("remove static search dependencies")
    os.remove(os.path.join("shellscripts", "dl_staticsearch.sh"))
    os.remove("ss_config.xml")
    os.remove("stopwords.txt")
    os.remove("words.txt")
    os.remove(os.path.join("shellscripts", "build_index.sh"))

if "{{ cookiecutter.search_engine }}" == "staticsearch":
    os.remove("make_ts_index.py")

if "{{ cookiecutter.translations }}" == "no":
    os.remove("make_translations.py")
    os.remove("translations.csv")
    os.remove(os.path.join("html", "js", "i18n.js"))
    shutil.rmtree(os.path.join("html", "locales"))
    os.replace(
        os.path.join("xslt", "partials", "html_navbar_no_translations.xsl"),
        os.path.join("xslt", "partials", "html_navbar.xsl"),
    )

if "{{ cookiecutter.data_dir }}":
    shutil.rmtree(os.path.join("data", "editions"), ignore_errors=True)
else:
    os.remove("fetch_data.sh")
