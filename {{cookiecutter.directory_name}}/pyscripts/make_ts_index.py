import glob
import os

import typesense
from acdh_tei_pyutils.tei import TeiReader
from acdh_tei_pyutils.utils import (
    extract_fulltext,
    get_xmlid,
    make_entity_label,
)
from tqdm import tqdm
from typesense.exceptions import ObjectNotFound

COLLECTION_NAME = "{{ cookiecutter.data_dir }}"
files = glob.glob("./data/editions/*.xml")
tag_blacklist = [
    "{http://www.tei-c.org/ns/1.0}abbr",
    "{http://www.tei-c.org/ns/1.0}del",
]
namespaces = {"tei": "http://www.tei-c.org/ns/1.0"}


TYPESENSE_API_KEY = os.environ.get("TYPESENSE_API_KEY", "xyz")
TYPESENSE_TIMEOUT = os.environ.get("TYPESENSE_TIMEOUT", "120")
TYPESENSE_HOST = os.environ.get("TYPESENSE_HOST", "localhost")
TYPESENSE_PORT = os.environ.get("TYPESENSE_PORT", "8108")
TYPESENSE_PROTOCOL = os.environ.get("TYPESENSE_PROTOCOL", "http")
client = typesense.Client(
    {
        "nodes": [
            {
                "host": TYPESENSE_HOST,
                "port": TYPESENSE_PORT,
                "protocol": TYPESENSE_PROTOCOL,
            }
        ],
        "api_key": TYPESENSE_API_KEY,
        "connection_timeout_seconds": int(TYPESENSE_TIMEOUT),
    }
)


try:
    client.collections[COLLECTION_NAME].delete()
except ObjectNotFound:
    pass

current_schema = {
    "name": COLLECTION_NAME,
    "enable_nested_fields": True,
    "fields": [
        {"name": "id", "type": "string"},
        {"name": "rec_id", "type": "string", "index": False},
        {"name": "title", "type": "string"},
        {"name": "full_text", "type": "string"},
        {"name": ".*_entities", "type": "auto", "facet": True, "optional": True},
    ],
}

client.collections.create(current_schema)


records = []
cfts_records = []
for x in tqdm(files, total=len(files)):
    doc = TeiReader(x)
    try:
        body = doc.any_xpath(".//tei:body")[0]
    except IndexError:
        continue
    record = {}
    record["id"] = os.path.split(x)[-1].replace(".xml", "")
    record["rec_id"] = os.path.split(x)[-1].replace(".xml", "")
    record["title"] = doc.any_xpath(".//tei:titleStmt/tei:title[1]")[0].text
    record["full_text"] = extract_fulltext(body, tag_blacklist=tag_blacklist)

    record["person_entities"] = []
    for y in doc.any_xpath(".//tei:back//tei:listPerson/tei:person[@xml:id]"):
        item = {}
        item["id"] = get_xmlid(y)
        item["label"] = make_entity_label(
            y.xpath("./tei:persName[1]", namespaces=namespaces)[0]
        )
        record["person_entities"].append(item)

    record["place_entities"] = []
    for y in doc.any_xpath(".//tei:back//tei:listPlace/tei:place[@xml:id]"):
        item = {}
        item["id"] = get_xmlid(y)
        item["label"] = make_entity_label(
            y.xpath("./tei:placeName[1]", namespaces=namespaces)[0]
        )
        record["place_entities"].append(item)

    record["org_entities"] = []
    for y in doc.any_xpath(".//tei:back//tei:listOrg/tei:org[@xml:id]"):
        item = {}
        item["id"] = get_xmlid(y)
        item["label"] = make_entity_label(
            y.xpath("./tei:orgName[1]", namespaces=namespaces)[0]
        )
        record["org_entities"].append(item)

    record["bibl_entities"] = []
    for y in doc.any_xpath(".//tei:back//tei:listBibl/tei:bibl[@xml:id]"):
        item = {}
        item["id"] = get_xmlid(y)
        item["label"] = extract_fulltext(
            y.xpath("./tei:title", namespaces=namespaces)[0]
        )
        record["bibl_entities"].append(item)

    records.append(record)
    print(record)


make_index = client.collections[COLLECTION_NAME].documents.import_(records)
print(make_index)
print("done with indexing jpbriefe")
