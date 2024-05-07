#!/usr/bin/env python

"""OS-agnostic setup script for DSE-Cookiecutter"""

import argparse
import configparser
import io
import logging
import os
import shutil
import tempfile
import xml.etree.ElementTree as ET
import zipfile
from typing import Tuple
from urllib.error import HTTPError, URLError
from urllib.request import urlopen

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)
logger = logging.getLogger(__name__)


class DSESetup:
    """
    Main class for DSE setup.
    """

    def __init__(self, config_path):
        self.SYSTEM = os.name

        self.SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

        self.config = configparser.ConfigParser()
        self.config.read(os.path.join(self.SCRIPT_DIR, config_path))

        self.PROJECT_ROOT = os.path.abspath(
            os.path.join(os.path.dirname(__file__), os.pardir)
        )
        self.DATA_DIR = os.path.join(
            self.PROJECT_ROOT, self.config.get("data", "base-dir")
        )

    def make_request(self, url: str) -> Tuple:
        """
        Makes an HTTP request to the given URL and returns the response as a tuple.
        :param url: The URL to connect to.
        :returns: A tuple with the resonse info in [0] and the response content in [1].
        :raises HTTPError, URLError: raises an exception
        """

        msg = f"Making request to {url}"
        logger.info(msg)

        try:
            with urlopen(url) as response:
                logger.info("%s OK!", msg)
                return (response.info(), response.read())
        except HTTPError as e:
            logger.error("HTTP error occured for url %s: %s", url, e)
            raise
        except URLError as e:
            logger.error("URL error occured for url %s: %s", url, e)
            raise

    def cleanup(self, file_or_directory_path: str) -> None:
        """Cleanup old file/directory versions.
        :param file_or_directory_path: The path to clean up."""

        msg = f"Deleting {os.path.relpath(file_or_directory_path)} ..."

        logger.info(msg)

        if not os.path.isfile(file_or_directory_path) and not os.path.isdir(
            file_or_directory_path
        ):
            logger.info("Nothing to delete!")
            return

        if os.path.isfile(file_or_directory_path):
            os.remove(file_or_directory_path)
        elif os.path.isdir(file_or_directory_path):
            shutil.rmtree(file_or_directory_path)
        logger.info("%s OK!", msg)

    def download_imprints(self) -> None:
        """Download imprint XML files for different locales."""

        msg = "Downloading imprints ..."

        imprint_filename = self.config.get("imprint", "filename")
        imprint_base_url = self.config.get("imprint", "base-url")
        imprint_query_parameters = self.config.get("imprint", "query-parameters")
        redmine_id = self.config.get("cookiecutter", "redmine-id")

        imprint_path = os.path.join(self.DATA_DIR, imprint_filename)

        # Delete old ../data/imprint.xml file
        self.cleanup(imprint_path)

        # Create XML
        tree = ET.ElementTree("tree")
        root = ET.Element("root")

        logger.info(msg)

        for locale in ["de", "en"]:
            url = f"{imprint_base_url}/{redmine_id}{imprint_query_parameters}{locale}"
            response = self.make_request(url)
            if response:
                charset = response[0].get_content_charset()
                response_content = response[1].decode(charset)
                imprint = ET.XML("<div>" + response_content + "</div>")
                imprint.set("lang", locale)
                root.append(imprint)

                logger.info("%s OK!", msg)

        tree._setroot(root)
        tree.write(
            imprint_path,
            encoding="utf-8",
            xml_declaration=True,
        )

    def download_saxon(self) -> None:
        """Download Saxon HE (Home Edition)."""

        msg = "Downloading saxon ..."

        saxon_download_url = self.config.get("saxon", "url")
        saxon_destination_directory = os.path.join(
            self.PROJECT_ROOT, self.config.get("saxon", "dir")
        )

        logger.info(msg)
        response = self.make_request(saxon_download_url)
        if response:
            content = zipfile.ZipFile(io.BytesIO(response[1]))
            content.extractall(saxon_destination_directory)
            logger.info("%s OK!", msg)
 
    def fetch_data(self) -> None:
        """Fetch transcriptions from data repository"""

        msg = "Fetching data ..."
        logger.info(msg)
        response = self.make_request(self.config.get("cookiecutter", "data-url"))

        if response:
            with tempfile.TemporaryDirectory() as tempdir:
                response[1].extractall(tempdir)
                for directory in self.config.items("data.subfolders"):
                    directory_path = os.path.join(self.DATA_DIR, directory[1])
                    self.cleanup(directory_path)
                    os.mkdir(directory_path)
                    shutil.move(
                        os.path.join(
                            tempdir,
                            f"{self.config.get('cookiecutter', 'data_dir')}-main",
                            self.config.get("data", "base-dir"),
                            directory,
                        ),
                        self.DATA_DIR,
                    )
            logger.info("%s OK!", msg)

    def run_setup(self, argument: str) -> None:
        """
        Main function.
        """
        if argument == "dd":
            logger.info("Downloading dependencies ...")
            self.download_imprints()
            self.download_saxon()
        elif argument == "fd":
            self.fetch_data()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="OS-agnostic setup script for DSE-Cookiecutter"
    )

    parser.add_argument(
        "-a",
        "--action",
        required=True,
        help="The desired action to execute. Choose from: dd (Download Dependencies), fd (Fetch Data)",
        choices=["dd", "fd"],
    )
    args = parser.parse_args()
    dse_setup = DSESetup("config.ini")
    dse_setup.run_setup(args.action)
