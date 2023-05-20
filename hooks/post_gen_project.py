import os


if "{{ cookiecutter.update_favicons }}" == "yes":
    print("you can run `python update_favicons.py")
else:
    os.remove("update_favicons.py")