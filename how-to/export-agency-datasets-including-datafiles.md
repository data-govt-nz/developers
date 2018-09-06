# How to export a local copy of an agencies datasets as a data package

## Summary
Export an agencies datasets into sub-folders including any hosted or referenced data files and a json file with metadata

## Requirements
 * A \*nix environment
 * [Python 2.7+](https://wiki.python.org/moin/BeginnersGuide/Download)
 * [CKANAPI Command line tool](https://github.com/ckan/ckanapi)
 * [`jq`](https://stedolan.github.io/jq/)
 * [`tr`](https://en.wikipedia.org/wiki/Tr_(Unix))

## Steps
 1. Make sure you have the CKANAPI CLI tool installed
 2. Make sure you have the `jq` and `tr` tools installed
 3. Run the command below replacing the properties in UPPERCASE with your own values.
 ```
 ckanapi dump datasets $(ckanapi -r CKAN_URL action package_search q=organization:AGENCY_ID | jq .results[].name | tr -d '"') -r CKAN_URL -D PATH_TO_FILES
 ```
