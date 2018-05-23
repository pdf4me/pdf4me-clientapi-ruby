# Pdf4me::MergeApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**merge**](MergeApi.md#merge) | **POST** /Merge/Merge | 
[**merge2_pdfs**](MergeApi.md#merge2_pdfs) | **POST** /Merge/Merge2Pdfs | 


# **merge**
> MergeRes merge(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::MergeApi.new

opts = { 
  req: Pdf4me::Merge.new # Merge | 
}

begin
  result = api_instance.merge(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling MergeApi->merge: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**Merge**](Merge.md)|  | [optional] 

### Return type

[**MergeRes**](MergeRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **merge2_pdfs**
> File merge2_pdfs(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::MergeApi.new

opts = { 
  file1: "file1_example", # String | 
  file2: "file2_example" # String | 
}

begin
  result = api_instance.merge2_pdfs(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling MergeApi->merge2_pdfs: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file1** | **String**|  | [optional] 
 **file2** | **String**|  | [optional] 

### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



