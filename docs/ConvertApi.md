# Pdf4me::ConvertApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**convert_file_to_pdf**](ConvertApi.md#convert_file_to_pdf) | **POST** /Convert/ConvertFileToPdf | 
[**convert_to_pdf**](ConvertApi.md#convert_to_pdf) | **POST** /Convert/ConvertToPdf | 


# **convert_file_to_pdf**
> File convert_file_to_pdf(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::ConvertApi.new

opts = { 
  file_name: "file_name_example", # String | 
  file: "file_example" # String | 
}

begin
  result = api_instance.convert_file_to_pdf(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling ConvertApi->convert_file_to_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file_name** | **String**|  | [optional] 
 **file** | **String**|  | [optional] 

### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



# **convert_to_pdf**
> ConvertToPdfRes convert_to_pdf(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::ConvertApi.new

opts = { 
  req: Pdf4me::ConvertToPdf.new # ConvertToPdf | 
}

begin
  result = api_instance.convert_to_pdf(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling ConvertApi->convert_to_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**ConvertToPdf**](ConvertToPdf.md)|  | [optional] 

### Return type

[**ConvertToPdfRes**](ConvertToPdfRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



