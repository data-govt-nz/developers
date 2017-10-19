# How to export all datasets from data.govt.nz into a CSV

## Summary
Using the [`ckanapi-exporter`](https://github.com/ckan/ckanapi-exporter) tool you can extract all dataset metadata into a single CSV file.

## Requirements
 - [Python 2.7](https://wiki.python.org/moin/BeginnersGuide/Download) or higher
 - [CKANAPI-Exporter](https://github.com/ckan/ckanapi-exporter) (`pip install ckanapi-exporter`)

## Steps
 1. Install requirements
 2. Download the columns.json file (sets out some preset data propoerties to extract from data.govt.nz API, you can customise if required)
 3. Run the below command on your terminal
 ```
 ckanapi-exporter --url 'https://catalogue.data.govt.nz' --columns columns.json > datasets.csv
 ```
