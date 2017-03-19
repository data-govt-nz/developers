# data.govt.nz developers
Developer documentation and code examples for use with data.govt.nz

Here are some resources that you can use to develop applications with the data on data.govt.nz. If you are using the APIs listed here, please review the data.govt.nz [Terms of Use](https://www.data.govt.nz/terms-of-use/).

## CKAN APIs
The prefix for web resource endpoints is `https://catalogue.data.govt.nz/api/action` and they return responses in JSON format. You can retrieve dataset and resource metadata through these functions:

|Resource Functions | Description |
|---|---|
|`/package_metadata_show?id={package id}`|Gets the metadata of a dataset and all of its data resources. All of the data resources' download link, last updated date, etc. can be retrieved here.|
|`/resource_metadata_show?id={resource id}`|Gets the metadata of a specific data resource. This function is a subset of `package_metadata_show` as it would have listed all of its data resources. The data resource download link, last updated date, etc. can be retrieved here.|

[CKAN provides full API documentation](http://docs.ckan.org/en/latest/api/index.html) with further endpoints and actions that can be called.

Code examples to get started are provided below (feel free to suggest further code snippets and examples via a pull request).

## Code Examples


### Example #1: Get the metadata of a Dataset:

 - Identify the appropriate web resource method to use: package_metadata_show
 - Identify the dataset you want and retrieve it's ID, for instance: new-zealand-public-sector-websites
 - Create POST HTTP call to: `https://catalogue.data.govt.nz/api/action/package_metadata_show?id=new-zealand-public-sector-websites`.
 - You will receive a JSON response containing the metadata for this dataset. After parsing the JSON response into an object, check if the request was successful by ensuring that the `response-json-object.success` value evaluates to true before proceeding.

The following example shows how you can use Python to retrieve dataset information from the site:

```
#!/usr/bin/env python
import urllib2
import urllib
import json
import pprint

# Use the json module to dump a dictionary to a string for posting.
data = urllib.quote(json.dumps({'id': 'new-zealand-public-sector-websites'}))

# Make the HTTP POST request.
response = urllib2.urlopen('https://catalogue.data.govt.nz/api/action/package_show', data)
assert response.code == 200

# Use the json module to load CKAN's response into a dictionary.
response_dict = json.loads(response.read())

# Check the contents of the response.
assert response_dict['success'] is True
result = response_dict['result']
pprint.pprint(result)
```
    
### Example #2: Get the metadata of a Resource:

Note: that retrieving the dataset metadata (as above) already includes metadata for all of its data resources.

 - Identify the appropriate web resource method to use: `resource_show`.
 - Identify the data resource you want and retrieve it's ID, for instance: `4c5f6967-6c6d-4981-aa10-6b6790918cb5`.
 - Create the URL call: `https://catalogue.data.govt.nz/api/action/resource_show?id=4c5f6967-6c6d-4981-aa10-6b6790918cb5`.
 - Make a POST request to the above URL and you will receive a response. After parsing the JSON response into an object, check if the request was successful by ensuring that the response-json-object.success value evaluates to true before proceeding.
 - Refer to CKAN's API Documentation for more detailed information on how to execute the API calls.

## DataStore API
The Datastore API is a useful tool for you to query specific rows of data within a data resource if they have been supplied in machine readable formats. For example is useful if a data resource has a million rows and you only just require the first ten rows for use. You can query for the underlying data contained in the resource (a CSV for example) using the `datastore_search` API action. Each row in the datastore corresponds to a Primary Key, identified by the _id field.

### Example: Using searching a resource

 - Identify the data resource you want and retrieve it's ID, for instance: `4c5f6967-6c6d-4981-aa10-6b6790918cb5`.
 - Create the URL call: `https://catalogue.data.govt.nz/api/action/datastore_search?q=health&resource_id=4c5f6967-6c6d-4981-aa10-6b6790918cb5`.
 - Make a web request to the above URL and you will receive a response. After parsing the JSON response into an object, check if the request was successful by ensuring that the response-json-object.success value evaluates to true before proceeding.
 - Query parameter q can be either a string or a dictionary. If it is a string, it will search on all fields on each row. If it is a dictionary as {"key1": "a", "key2": "b"}, it will search on each specific field.
