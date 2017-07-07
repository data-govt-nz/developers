# How to make advanced queries on the data.govt.nz CKAN API

The CKAN API leverages the Solr serach query langauge to perform more complex searches against the metadata and data held in the data.govt.nz CKAN portal.

## Example: Returning new datasets created between 2 dates

In this exmaple we're going to return any newly created datasets since the migration of data.govt.nz from our old portal to the new CKAN powered one.

 1. Firstly, the API endpoint to use is:

```
https://catalogue.data.govt.nz/api/3/action/package_search

```
  This will return everything from the catalogue but only the first 10 items and it will include all metadata for each record i.e. all the resources, tags etc


  2. Next, let's refine this list using the Solr `filtered quiery (fq)` parameter on the `metadata_created` property to get datasets created between 12 April and 30 June (date of migration until end of financial year for NZ Government).

```
https://catalogue.data.govt.nz/api/3/action/package_search?fq=metadata_created:[2017-04-12T00:00:00Z TO 2017-06-30T23:59:99.999Z]
```
 
  3. There should be 272 results however we can only see 10, let's expand the number of results using the `rows` parameter (note: you use a combo of the `rows` and `start` paramters to do paging in the CKAN API).
  
  ```
  https://catalogue.data.govt.nz/api/3/action/package_search?fq=metadata_created:[2017-04-12T00:00:00Z%20TO%202017-06-30T23:59:99.999Z]&rows=500
  ```
 
