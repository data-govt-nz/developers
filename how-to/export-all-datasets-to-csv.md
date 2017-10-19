# How to export all datasets from data.govt.nz into a CSV

## Summary
Using the [`ckanapi-exporter`](https://github.com/ckan/ckanapi-exporter) tool you can extract all dataset metadata into a single CSV file.

## Requirements
 - [Python 2.7+](https://wiki.python.org/moin/BeginnersGuide/Download)
 - [CKANAPI-Exporter 0.1.0+](https://github.com/ckan/ckanapi-exporter) (`pip install ckanapi-exporter`)
 - A command line

## Steps
 1. Install requirements
 2. Create a columns.json file (sets out some preset data propoerties to extract from data.govt.nz API, you can customise if required). See below for file contents.
 3. Run the below command on your terminal
 ```
 ckanapi-exporter --url 'https://catalogue.data.govt.nz' --columns columns.json > datasets.csv
 ```
 
 ## columns.json
 ```JSON
 {
  "Title": {
      "pattern": "^title$"
  },
  "Agency": {
      "pattern": ["^organization$", "^title$"]
  },
  "URL": {
      "pattern": "^url$"
  },
  "CatalogueCreated": {
      "pattern": "^metadata_created$",
      "max_length": 10
  },
  "CatalogueLastUpdated": {
      "pattern": "^metadata_modified$",
      "max_length": 10
  },
  "DatasetCreated": {
      "pattern": "^issued$"
  },
  "DatasetLastUpdated": {
      "pattern": "^modified$"
  },
  "FrequencyOfUpdate": {
      "pattern": "^frequency_of_update$"
  },
  "Rights": {
      "pattern": "^license_title$"
  },
  "FormatsAvailable": {
      "pattern": ["^resources$", "^format$"],
      "case_sensitive": true,
      "deduplicate": true
  },
  "Description": {
      "pattern": "^notes$"
  },
  "Tags": {
    "pattern": ["^tags$", "^display_name$"]
  },
  "Groups": {
      "pattern": ["^groups$", "^display_name$"]
  },
  "AgencyContact": {
      "pattern": "^author$"
  },
  "AgencyContactEmail":{
      "pattern": "^author_email$"
  },
  "AgencyContactPhone":{
      "pattern": "^author_phone$"
  },
  "DatasetContact": {
      "pattern": "^maintainer$"
  },
  "DatasetContactEmail": {
      "pattern": "^maintainer_email$"
  },
  "DatasetContactPhone": {
      "pattern": "^maintainer_phone$"
  },
  "PerminentIdentifier":{
      "pattern": "^id$"
  },
  "SourceIdentifier": {
      "pattern": "^source_identifier$"
  }
}

 ```
