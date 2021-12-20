<?php
if ($argc < 5) {
    echo "\nUsage: $argv[0] rdfFileToImport archeBaseUrl login password\n\n";
    exit(1);
}

use acdhOeaw\arche\lib\Repo;
use acdhOeaw\arche\lib\ingest\MetadataCollection;
use acdhOeaw\arche\lib\ingest\IndexerException;
include 'vendor/autoload.php';

$options = [
    'auth' => [$argv[3], $argv[4]],
];
$repo = Repo::factoryFromUrl($argv[2], $options);
MetadataCollection::$debug = true;

echo "\n######################################################\nImporting $argv[1]\n######################################################\n\n";
$graph = new MetadataCollection($repo, $argv[1]);
$graph->preprocess();
try {
    $repo->begin();
    $resources = $graph->import('https://id.acdh.oeaw.ac.at/', MetadataCollection::SKIP, MetadataCollection::ERRMODE_PASS);
    $repo->commit();
    echo "\n######################################################\nImport ended\n######################################################\n";
} catch (GuzzleHttp\Exception\RequestException $e) {
    echo "\n######################################################\nImport failed\n######################################################\n";
    echo "HTTP response code " . $e->getResponse()->getStatusCode() . "\n";
    echo $e->getResponse()->getBody() . "\n";
    exit(2);
} catch (IndexerException $e) {
    echo "\n######################################################\nImport failed\n######################################################\n";
    echo $e->getMessage() . "\n";
    exit(3);
}

