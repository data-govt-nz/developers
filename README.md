# data.govt.nz developers
Developer documentation and code examples for use with data.govt.nz

Here are some resources that you can use to develop applications with the data on data.govt.nz. If you are using the APIs listed here, please review the data.govt.nz [Terms of Use](https://www.data.govt.nz/terms-of-use/).

## CKAN APIs
The prefix for web resource endpoints is `https://catalogue.data.govt.nz/api/3/action` and they return responses in JSON format. You can retrieve dataset and resource metadata through these functions:

|Resource Functions | Description |
|---|---|
|`/package_metadata_show?id={package id}`|Gets the metadata of a dataset and all of its data resources. All of the data resources' download link, last updated date, etc. can be retrieved here.|
|`/resource_metadata_show?id={resource id}`|Gets the metadata of a specific data resource. This function is a subset of `package_metadata_show` as it would have listed all of its data resources. The data resource download link, last updated date, etc. can be retrieved here.|

[CKAN provides full API documentation](http://docs.ckan.org/en/latest/api/index.html) with further endpoints and actions that can be called.

Code examples to get started are provided below (feel free to suggest further code snippets and examples via a pull request).

## Code Examples


### Example #1: Get the metadata of a Dataset:

 - Identify the appropriate web resource method to use: package_metadata_show
 - Identify the dataset you want and retrieve it's ID, for instance: age-specific-death-rates-annual
 - Create the URL call: `https://catalogue.data.govt.nz/api/3/action/package_metadata_show?id=`.
Make a web request to the above URL and you will receive a response. After parsing the JSON response into an object, check if the request was successful by ensuring that the response-json-object.success value evaluates to true before proceeding.
The following example shows how you can use Python to retrieve dataset information from the site:

#!/usr/bin/env python
import urllib2
import urllib
import json
import pprint

# Use the json module to dump a dictionary to a string for posting.
data_string = urllib.quote(json.dumps({'id': 'data-explorer'}))

# Make the HTTP request.
response = urllib2.urlopen
('https://catalogue.data.govt.nz/api/3/action/package_metadata_show?id=',data_string)
assert response.code == 200

# Use the json module to load CKAN's response into a dictionary.
response_dict = json.loads(response.read())

# Check the contents of the response.
assert response_dict['success'] is True
result = response_dict['result']
pprint.pprint(result)
    
The following example shows how you can use Javascript and jQuery to retrieve dataset information from the site:

var data = {
id: 'age-specific-death-rates-annual'
};

$.ajax({
url: 'https://catalogue.data.govt.nz/api/3/action/package_metadata_show',
data: data,
dataType: 'jsonp',
success: function(data) {
alert('Response status: ' + data.success)

// do more with the response
}
});
    
Example #2: Get the metadata of a Resource:

Important: Note that retrieving the dataset metadata already includes metadata for all of its data resources.

Identify the appropriate web resource method to use: resource_metadata_show
Identify the data resource you want and retrieve it's ID, for instance: 66f3eec1-9e1e-4df6-9706-7b7e844e5377.
Create the URL call: https://catalogue.data.govt.nz/api/3/action/resource_metadata_show?id=.
Make a web request to the above URL and you will receive a response. After parsing the JSON response into an object, check if the request was successful by ensuring that the response-json-object.success value evaluates to true before proceeding.
Refer to CKAN's API Documentation for more detailed i nformation on how to execute the API calls.

DataStore API
The Datastore API is a wonderful tool for you to query specific rows of data within a data resource. This is especially useful if a data resource has a million rows and you only just require the first ten rows for use. You can query for data using the datastore_search resource function. Each row in the datastore corresponds to a Primary Key, identified by the _id field.

Example: Using a generic search

Identify the data resource you want and retrieve it's ID, for instance: .
Create the URL call: https://catalogue.data.govt.nz/api/3/action/datastore_search?q=&resource_id= .
Make a web request to the above URL and you will receive a response. After parsing the JSON response into an object, check if the request was successful by ensuring that the response-json-object.success value evaluates to true before proceeding.
Query parameter q can be either a string or a dictionary. If it is a string, it will search on all fields on each row. If it is a dictionary as {"key1": "a", "key2": "b"}, it will search on each specific field.
