# Pdf4me::StampApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**stamp**](StampApi.md#stamp) | **POST** /Stamp/Stamp | 
[**text_stamp**](StampApi.md#text_stamp) | **POST** /Stamp/TextStamp | 


# **stamp**
> StampRes stamp(opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::StampApi.new

opts = { 
  req: Pdf4me::Stamp.new # Stamp | 
}

begin
  result = api_instance.stamp(opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling StampApi->stamp: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | [**Stamp**](Stamp.md)|  | [optional] 

### Return type

[**StampRes**](StampRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json, application/bson
 - **Accept**: text/plain, application/json, text/json, application/bson



# **text_stamp**
> File text_stamp(align_x, align_y, opts)



### Example
```ruby
# load the gem
require 'pdf4me'

api_instance = Pdf4me::StampApi.new

align_x = "align_x_example" # String | 

align_y = "align_y_example" # String | 

opts = { 
  text: "text_example", # String | 
  pages: "pages_example", # String | 
  file: "file_example" # String | 
}

begin
  result = api_instance.text_stamp(align_x, align_y, opts)
  p result
rescue Pdf4me::ApiError => e
  puts "Exception when calling StampApi->text_stamp: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **align_x** | **String**|  | 
 **align_y** | **String**|  | 
 **text** | **String**|  | [optional] 
 **pages** | **String**|  | [optional] 
 **file** | **String**|  | [optional] 

### Return type

**File**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



