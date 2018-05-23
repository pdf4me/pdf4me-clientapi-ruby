# Pdf4me::DocumentApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**drop_document**](DocumentApi.md#drop_document) | **POST** /Document/DropDocument | DropDocument
[**drop_document_0**](DocumentApi.md#drop_document_0) | **POST** /Document/ProduceDocuments | ProduceDocuments
[**get_document**](DocumentApi.md#get_document) | **POST** /Document/GetDocument | GetDocument
[**get_documents**](DocumentApi.md#get_documents) | **GET** /Document/GetDocuments | GetDocuments


# **drop_document**
> DropDocumentRes drop_document(opts)

DropDocument

Drop a document from local FIlesystem or give a cloud storage from where the files will be downloaded.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::DocumentApi.new

opts = { 
  req: Pdf4me::DropDocumentReq.new # DropDocumentReq | 
}

begin
  #DropDocument
  result = api_instance.drop_document(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling DocumentApi->drop_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**DropDocumentReq**](DropDocumentReq.md)|  | [optional] 

### Return type

[**DropDocumentRes**](DropDocumentRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **drop_document_0**
> ProduceDocumentsRes drop_document_0(opts)

ProduceDocuments

Produce the requested new Order Documents.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::DocumentApi.new

opts = { 
  req: Pdf4me::ProduceDocuments.new # ProduceDocuments | 
}

begin
  #ProduceDocuments
  result = api_instance.drop_document_0(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling DocumentApi->drop_document_0: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**ProduceDocuments**](ProduceDocuments.md)|  | [optional] 

### Return type

[**ProduceDocumentsRes**](ProduceDocumentsRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **get_document**
> GetDocumentRes get_document(opts)

GetDocument

Get the content of a document in its full datastructure and content.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::DocumentApi.new

opts = { 
  req: Pdf4me::GetDocumentReq.new # GetDocumentReq | 
}

begin
  #GetDocument
  result = api_instance.get_document(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling DocumentApi->get_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**GetDocumentReq**](GetDocumentReq.md)|  | [optional] 

### Return type

[**GetDocumentRes**](GetDocumentRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **get_documents**
> GetDocumentRes get_documents(job_id)

GetDocuments

Get the workingset of documents by the JobId.

### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::DocumentApi.new

job_id = "job_id_example" # String | 


begin
  #GetDocuments
  result = api_instance.get_documents(job_id)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling DocumentApi->get_documents: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **job_id** | [**String**](.md)|  | 

### Return type

[**GetDocumentRes**](GetDocumentRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json, application/bson



