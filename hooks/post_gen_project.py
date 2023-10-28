import os
import shutil


if "{{ cookiecutter.update_favicons }}" == "yes":
    print("you can run `python update_favicons.py")
else:
    os.remove("update_favicons.py")

if "{{ cookiecutter.search_engine }}" == "typesense":
    print("remove static search dependencies")
    os.remove("./shellscripts/dl_staticsearch.sh")
    os.remove("./ss_config.xml")
    os.remove("./stopwords.txt")
    os.remove("./words.txt")
    os.remove("./shellscripts/build_index.sh")

if "{{ cookiecutter.search_engine }}" == "staticsearch":
    os.remove("./make_ts_index.py")

if "{{ cookiecutter.translations }}" == "no":
    os.remove("./make_translations.py")
    os.remove("./translations.csv")
    os.remove("./html/js/i18n.js")
    shutil.rmtree("./html/locales")
    os.rename("./xslt/partials/html_navbar_no_translations.xsl", "./xslt/partials/html_navbar.xsl")