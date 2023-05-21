import os


if "{{ cookiecutter.update_favicons }}" == "yes":
    print("you can run `python update_favicons.py")
else:
    os.remove("update_favicons.py")

if "{{ cookiecutter.search_engine }}" == "typesense":
    print("remove static search dependencies")
    os.remove("./shellscripts/dl_staticsearch.sh")
    os.remove("./ss_config.xml")
    os.remove("./shellscripts/build_index.sh")