# Pdf4me::ExtractApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**extract**](ExtractApi.md#extract) | **POST** /Extract/Extract | 
[**extract_pages**](ExtractApi.md#extract_pages) | **POST** /Extract/ExtractPages | 


# **extract**
> ExtractRes extract(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::ExtractApi.new

opts = { 
  req: Pdf4me::Extract.new # Extract | 
}

begin
  result = api_instance.extract(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling ExtractApi->extract: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**Extract**](Extract.md)|  | [optional] 

### Return type

[**ExtractRes**](ExtractRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **extract_pages**
> File extract_pages(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::ExtractApi.new

opts = { 
  page_nrs: "page_nrs_example", # String | 
  file: "file_example" # String | 
}

begin
  result = api_instance.extract_pages(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling ExtractApi->extract_pages: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page_nrs** | **String**|  | [optional] 
 **file** | **String**|  | [optional] 

### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



