import os
from favicons import Favicons

ICON = os.environ.get("ICON", "./html/images/logo.png")
OUT_DIR = os.environ.get("OUT_DIR", "html/images/favicons")

if os.environ.get("NOT_TRANSPARENT"):
    TRANSPARENT = False
else:
    TRANSPARENT = True
BASE_URL = f"{OUT_DIR}/"

SNIPPET = "snippet.html"

os.makedirs(OUT_DIR, exist_ok=True)


with Favicons(ICON, OUT_DIR, base_url=BASE_URL, transparent=TRANSPARENT) as favicons:
    favicons.generate()
    html = favicons.html()

with open(SNIPPET, "w") as f:
    f.write("<!-- favicon -->\n")
    for x in html:
        f.write(f"{x}\n".replace('html/', ''))
    f.write("<!-- favicon end -->")

print(f"converted {ICON} into favicon, located at {OUT_DIR}")

print(f"coppy {SNIPPET} into ./xslt/partials/html_head.xsl")