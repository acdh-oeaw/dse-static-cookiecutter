import glob
import os

from typesense.api_call import ObjectNotFound
from acdh_cfts_pyutils import TYPESENSE_CLIENT as client
from acdh_cfts_pyutils import CFTS_COLLECTION
from acdh_tei_pyutils.tei import TeiReader
from tqdm import tqdm


files = glob.glob("./data/editions/*/*.xml")


try:
    client.collections["{{cookiecutter.project_short_title}}"].delete()
except ObjectNotFound:
    pass

current_schema = {
    "name": "{{cookiecutter.project_short_title}}",
    "fields": [
        {"name": "id", "type": "string"},
        {"name": "rec_id", "type": "string"},
        {"name": "title", "type": "string"},
        {"name": "full_text", "type": "string"},
        {
            "name": "year",
            "type": "int32",
            "optional": True,
            "facet": True,
        },
        {"name": "persons", "type": "string[]", "facet": True, "optional": True},
        {"name": "places", "type": "string[]", "facet": True, "optional": True},
        {"name": "orgs", "type": "string[]", "facet": True, "optional": True},
    ],
}

client.collections.create(current_schema)


def get_entities(ent_type, ent_node, ent_name):
    entities = []
    e_path = f'.//tei:rs[@type="{ent_type}"]/@ref'
    for p in body:
        ent = p.xpath(e_path, namespaces={"tei": "http://www.tei-c.org/ns/1.0"})
        ref = [ref.replace("#", "") for e in ent if len(ent) > 0 for ref in e.split()]
        for r in ref:
            p_path = f'.//tei:{ent_node}[@xml:id="{r}"]//tei:{ent_name}[1]'
            en = doc.any_xpath(p_path)
            if en:
                entity = " ".join(" ".join(en[0].xpath(".//text()")).split())
                if len(entity) != 0:
                    entities.append(entity)
                else:
                    with open("log-entities.txt", "a") as f:
                        f.write(f"{r} in {record['id']}\n")
    return [ent for ent in sorted(set(entities))]


records = []
cfts_records = []
for x in tqdm(files, total=len(files)):
    doc = TeiReader(xml=x, xsl="./xslt/preprocess_typesense.xsl")
    facs = doc.any_xpath(".//tei:body/tei:div/tei:pb/@facs")
    pages = 0
    for v in facs:
        p_group = f".//tei:body/tei:div/tei:p[preceding-sibling::tei:pb[1]/@facs='{v}']|.//tei:body/tei:div/tei:lg[preceding-sibling::tei:pb[1]/@facs='{v}']"
        body = doc.any_xpath(p_group)
        pages += 1
        cfts_record = {
            "project": "{{cookiecutter.project_short_title}}",
        }
        record = {}
        record["id"] = os.path.split(x)[-1].replace(".xml", f".html?tab={str(pages)}")
        cfts_record["id"] = record["id"]
        cfts_record["resolver"] = f"{{cookiecutter.github_url}}/{record['id']}"
        record["rec_id"] = os.path.split(x)[-1]
        cfts_record["rec_id"] = record["rec_id"]
        r_title = " ".join(
            " ".join(
                doc.any_xpath('.//tei:titleStmt/tei:title[@level="a"]/text()')
            ).split()
        )
        record["title"] = f"{r_title} Page {str(pages)}"
        cfts_record["title"] = record["title"]
        try:
            date_str = doc.any_xpath("//tei:origin/tei:origDate/@notBefore")[0]
        except IndexError:
            date_str = doc.any_xpath("//tei:origin/tei:origDate/text()")[0]
            data_str = date_str.split("--")[0]
            if len(date_str) > 3:
                date_str = date_str
            else:
                date_str = "1959"

        try:
            record["year"] = int(date_str[:4])
            cfts_record["year"] = int(date_str[:4])
        except ValueError:
            pass

        if len(body) > 0:
            # get unique persons per page
            ent_type = "person"
            ent_name = "persName"
            record["persons"] = get_entities(
                ent_type=ent_type, ent_node=ent_type, ent_name=ent_name
            )
            cfts_record["persons"] = record["persons"]
            # get unique places per page
            ent_type = "place"
            ent_name = "placeName"
            record["places"] = get_entities(
                ent_type=ent_type, ent_node=ent_type, ent_name=ent_name
            )
            cfts_record["places"] = record["places"]
            # get unique orgs per page
            ent_type = "org"
            ent_name = "orgName"
            record["orgs"] = get_entities(
                ent_type=ent_type, ent_node=ent_type, ent_name=ent_name
            )
            cfts_record["orgs"] = record["orgs"]
            # get unique bibls per page
            ent_type = "lit_work"
            ent_name = "title"
            ent_node = "bibl"
            record["works"] = get_entities(
                ent_type=ent_type, ent_node=ent_node, ent_name=ent_name
            )
            cfts_record["works"] = record["works"]
            record["full_text"] = "\n".join(
                " ".join("".join(p.itertext()).split()) for p in body
            )
            if len(record["full_text"]) > 0:
                records.append(record)
                cfts_record["full_text"] = record["full_text"]
                cfts_records.append(cfts_record)

make_index = client.collections[
    "{{cookiecutter.project_short_title}}"
].documents.import_(records)
print(make_index)
print("done with indexing {{cookiecutter.project_short_title}}")

make_index = CFTS_COLLECTION.documents.import_(cfts_records, {"action": "upsert"})
print(make_index)
print("done with cfts-index {{cookiecutter.project_short_title}}")
