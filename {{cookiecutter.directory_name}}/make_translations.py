import csv
import os
import json

TRANSLATIONS = "translations.csv"
locales_dir = os.path.join("html", "locales")
os.makedirs(locales_dir, exist_ok=True)


langs = []
with open(TRANSLATIONS, newline="") as f:
    csv_reader = csv.DictReader(f)
    langs = list(dict(list(csv_reader)[0]).keys())[1:]

data = {}
for x in langs:
    data[x] = {}
with open(TRANSLATIONS, newline="") as f:
    csv_reader = csv.DictReader(f)
    for row in csv_reader:
        for lang in langs:
            data[lang][row["key"]] = row[lang]

for key, value in data.items():
    lang_dir = os.path.join(locales_dir, key)
    os.makedirs(lang_dir, exist_ok=True)
    locales_file = f"{lang_dir}/translation.json"
    with open(locales_file, "w") as f:
        json.dump(value, f, ensure_ascii=False, indent=4)